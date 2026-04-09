import 'package:flutter/material.dart';

class ScamSimulationScreen extends StatefulWidget {
  @override
  _ScamSimulationScreenState createState() => _ScamSimulationScreenState();
}

class _ScamSimulationScreenState extends State<ScamSimulationScreen> {
  final List<Map<String, dynamic>> quizQuestions = [
    {
      "question": "You receive a call asking for OTP. What will you do?",
      "options": ["Share OTP", "Ignore Call"],
      "correct": 1
    },
    {
      "question": "Message: 'You won ₹10 lakh lottery'. What do you do?",
      "options": ["Click link", "Ignore"],
      "correct": 1
    },
    {
      "question": "QR code sent to receive money. What will you do?",
      "options": ["Scan", "Do not scan"],
      "correct": 1
    },
    {
      "question": "Unknown app asks permissions. What do you do?",
      "options": ["Allow", "Deny"],
      "correct": 1
    },
    {
      "question": "Bank asks PIN on call. What do you do?",
      "options": ["Tell PIN", "Never share"],
      "correct": 1
    },
  ];

  final List<String> dailyTips = [
    "Never share your OTP with anyone.",
    "Do not click unknown links.",
    "Always verify bank calls.",
    "Avoid downloading unknown apps.",
    "Check website URL before entering details.",
    "Enable two-factor authentication.",
    "Use strong passwords.",
    "Do not trust lottery messages.",
  ];

  int getDailyIndex() {
    final now = DateTime.now();
    return now.day % (quizQuestions.length + dailyTips.length);
  }

  @override
  Widget build(BuildContext context) {
    int index = getDailyIndex();

    bool showQuiz = index < quizQuestions.length;

    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      appBar: AppBar(
        title: Text("Daily Cyber Awareness"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: showQuiz ? buildQuiz(index) : buildTip(index),
      ),
    );
  }

  // 🔥 QUIZ UI
  Widget buildQuiz(int index) {
    final q = quizQuestions[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Question",
          style: TextStyle(color: Colors.green, fontSize: 18),
        ),
        SizedBox(height: 10),

        Text(
          q["question"],
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),

        SizedBox(height: 30),

        ...List.generate(q["options"].length, (i) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A1F35),
                padding: EdgeInsets.all(15),
              ),
              onPressed: () {
                bool correct = i == q["correct"];

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      correct
                          ? "✅ Correct! Stay safe"
                          : "❌ Wrong! Be careful",
                    ),
                    backgroundColor:
                        correct ? Colors.green : Colors.red,
                  ),
                );
              },
              child: Text(q["options"][i]),
            ),
          );
        })
      ],
    );
  }

  // 🔥 TIP UI
  Widget buildTip(int index) {
    int tipIndex = index - quizQuestions.length;

    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFF1A1F35),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.lightbulb, color: Colors.yellow, size: 50),

            SizedBox(height: 20),

            Text(
              "Today's Safety Tip",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),

            SizedBox(height: 15),

            Text(
              dailyTips[tipIndex],
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}