import 'package:flutter/material.dart';
import '../services/language_service.dart';

class LanguageSelectScreen extends StatelessWidget {
  const LanguageSelectScreen({Key? key}) : super(key: key);

  Widget buildLang(
      String title, String code, IconData icon, BuildContext context) {
    return Card(
      color: Color(0xFF1A1F35),
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF00E676)),
        title: Text(title,
            style: TextStyle(color: Colors.white, fontSize: 18)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () async {
          await LanguageService.setLanguage(code);

          Navigator.pushReplacementNamed(context, '/landing');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      appBar: AppBar(
        title: Text("Select Language"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Choose your preferred language",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            buildLang("English", "en", Icons.language, context),
            buildLang("हिंदी (Hindi)", "hi", Icons.translate, context),
            buildLang("తెలుగు (Telugu)", "te", Icons.record_voice_over, context),
          ],
        ),
      ),
    );
  }
}