import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {
      "title": "Learn Hub",
      "icon": Icons.school,
      "route": "/education",
    },
    {
      "title": "AI Help",
      "icon": Icons.smart_toy,
      "route": "/ai",
    },
    {
      "title": "Simulation",
      "icon": Icons.play_circle,
      "route": "/simulation",
    },
    {
      "title": "Scam Alerts",
      "icon": Icons.warning,
      "route": "/alerts",
    },
    {
      "title": "Emergency",
      "icon": Icons.call,
      "route": "/emergency",
    },
    {
      "title": "Profile",
      "icon": Icons.person,
      "route": "/profile",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Cyber Suraksha",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: features.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            return _buildCard(context, features[index]);
          },
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Map<String, dynamic> feature) {
    return GestureDetector(
     onTap: () {
  if (feature["route"] != null) {
    Navigator.pushNamed(context, feature["route"]);
  }
},
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1A1F35),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              feature["icon"],
              size: 40,
              color: Color(0xFF00E676),
            ),
            SizedBox(height: 10),
            Text(
              feature["title"],
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}