import 'package:flutter/material.dart';

// 🔥 Import your screens
import 'screens/smart_welcome_screen.dart';
import 'screens/feature_intro_screen.dart';
import 'screens/language_select_screen.dart';
import 'screens/landing_page.dart';
import 'screens/auth_page.dart';
import 'screens/home_screen.dart';
import 'screens/education_screen.dart';
import 'screens/ai_help_screen.dart';
import 'screens/scam_simulation_screen.dart';
import 'screens/scam_alerts_screen.dart';
import 'screens/emergency_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  // 🔥 ERROR UI FIX (no red screen)
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      body: Center(
        child: Text(
          "Something went wrong",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  };

  runApp(CyberSurakshaApp());
}

// 🔥 MAIN APP
class CyberSurakshaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E1A),
      ),

      initialRoute: '/welcome',

      routes: {
        '/welcome': (_) => SmartWelcomeScreen(),
        '/intro': (_) => FeatureIntroScreen(),
        '/language': (_) => LanguageSelectScreen(),
        '/landing': (_) => LandingPage(),
        '/auth': (_) => AuthPage(),
        '/home': (_) => HomeScreen(),
        '/education': (_) => EducationScreen(),
        '/ai': (_) => AIHelpScreen(),
        '/simulation': (_) => ScamSimulationScreen(),
        '/alerts': (_) => ScamAlertsScreen(),
        '/emergency': (_) => EmergencyScreen(),
        '/profile': (_) => ProfileScreen(),
      },
    );
  }
}