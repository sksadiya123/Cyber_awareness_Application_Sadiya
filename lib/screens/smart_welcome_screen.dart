import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/services.dart';


class SmartWelcomeScreen extends StatefulWidget {
  @override
  _SmartWelcomeScreenState createState() => _SmartWelcomeScreenState();
}

class _SmartWelcomeScreenState extends State<SmartWelcomeScreen> {
  FlutterTts tts = FlutterTts();

  @override
  void initState() {
    super.initState();

  Future.delayed(Duration(milliseconds: 500), () {
    speak();
  });
  }

  speak() async {
    await tts.setLanguage("en-IN");
    await tts.setSpeechRate(0.4);
    await tts.speak(
      "Welcome to Cyber Suraksha App. Learn to stay safe from online fraud and scams."
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A0E1A), Color(0xFF1A1F35)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.security, size: 100, color: Color(0xFF00E676)),

              SizedBox(height: 20),

              Text(
                "Cyber Suraksha",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Stay Safe • Stay Smart",
                style: TextStyle(color: Colors.grey),
              ),

              SizedBox(height: 40),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00E676),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  HapticFeedback.mediumImpact(); // ✅ correct

  Navigator.pushReplacementNamed(context, '/intro');
                },
                child: Text("Start Learning",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,),),
              )
            ],
          ),
        ),
      ),
    );
  }
}