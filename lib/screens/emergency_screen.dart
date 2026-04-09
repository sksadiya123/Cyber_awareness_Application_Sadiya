import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      appBar: AppBar(
        title: Text("Emergency Help"),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning, color: Colors.red, size: 80),

            SizedBox(height: 20),

            Text(
              "Cyber Helpline",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),

            SizedBox(height: 10),

            Text(
              "Call 1930",
              style: TextStyle(color: Colors.green, fontSize: 26),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {},
              child: Text("Call Now"),
            )
          ],
        ),
      ),
    );
  }
}