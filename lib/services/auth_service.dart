import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService {
  static const String _usersKey = 'registered_users';
  static const String _currentUserKey = 'current_user';

  // Gmail validation
  static bool isValidGmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(email);
  }

  // Password validation
  static String? validatePassword(String password) {
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain a number';
    }
    return null;
  }

  // Register user
  static Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      if (!isValidGmail(email)) {
        return {'success': false, 'message': 'Please use a valid Gmail address'};
      }

      String? passwordError = validatePassword(password);
      if (passwordError != null) {
        return {'success': false, 'message': passwordError};
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? usersJson = prefs.getString(_usersKey);
      List<Map<String, dynamic>> users = [];
      
      if (usersJson != null) {
        users = List<Map<String, dynamic>>.from(json.decode(usersJson));
      }

      // Check if user already exists
      bool userExists = users.any((user) => user['email'] == email);
      if (userExists) {
        return {'success': false, 'message': 'User already exists with this email'};
      }

      // Add new user
      Map<String, dynamic> newUser = {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'name': name,
        'email': email,
        'password': password,
        'createdAt': DateTime.now().toIso8601String(),
      };

      users.add(newUser);
      await prefs.setString(_usersKey, json.encode(users));

      return {'success': true, 'message': 'Registration successful!'};
    } catch (e) {
      return {'success': false, 'message': 'Registration failed. Please try again.'};
    }
  }

  // Sign in user - only registered users can sign in
  static Future<Map<String, dynamic>> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      if (!isValidGmail(email)) {
        return {'success': false, 'message': 'Please use a valid Gmail address'};
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? usersJson = prefs.getString(_usersKey);
      
      if (usersJson == null) {
        return {'success': false, 'message': 'No account found. Please sign up first.'};
      }

      List<Map<String, dynamic>> users = List<Map<String, dynamic>>.from(json.decode(usersJson));
      
      // Find user with matching credentials
      Map<String, dynamic>? user;
      try {
        user = users.firstWhere(
          (u) => u['email'] == email && u['password'] == password,
        );
      } catch (e) {
        return {'success': false, 'message': 'Invalid credentials or account not found'};
      }

      // Save current user session
      await prefs.setString(_currentUserKey, json.encode(user));
      
      return {'success': true, 'message': 'Welcome back!', 'user': user};
    } catch (e) {
      return {'success': false, 'message': 'Sign in failed. Please try again.'};
    }
  }

  // Check if user is logged in
  static Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_currentUserKey);
  }

  // Get current user
  static Future<Map<String, dynamic>?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(_currentUserKey);
    if (userJson != null) {
      return Map<String, dynamic>.from(json.decode(userJson));
    }
    return null;
  }

  // Sign out
  static Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentUserKey);
  }
}