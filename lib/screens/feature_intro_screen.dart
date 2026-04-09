import 'package:flutter/material.dart';

class FeatureIntroScreen extends StatelessWidget {

  Widget buildFeature(String title, IconData icon) {
    return Card(
      color: Color(0xFF1A1F35),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF00E676)),
        title: Text(title, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      appBar: AppBar(title: Text("What You Will Learn")),
      body: Column(
        children: [
          buildFeature("Learn Cyber Safety", Icons.school),
          buildFeature("AI Chatbot Help", Icons.chat),
          buildFeature("Real Scam Simulation", Icons.warning),
          buildFeature("Daily Safety Tips", Icons.lightbulb),
          buildFeature("Emergency Help", Icons.call),

          Spacer(),

          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/language');
            },
            child: Text("Continue"),
          )
        ],
      ),
    );
  }
}