import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.green,
              child: Icon(Icons.person, size: 45, color: Colors.white),
            ),

            SizedBox(height: 20),

            Text(
              "Cyber Suraksha User",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            SizedBox(height: 10),

            Text(
              "Stay safe from cyber threats!",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 30),

            Card(
              color: Color(0xFF1A1F35),
              child: ListTile(
                leading: Icon(Icons.security, color: Colors.green),
                title: Text("Security Tips",
                    style: TextStyle(color: Colors.white)),
              ),
            ),

            Card(
              color: Color(0xFF1A1F35),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title:
                    Text("Logout", style: TextStyle(color: Colors.white)),
                onTap: () async {
                  await AuthService.signOut();

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/auth',
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}