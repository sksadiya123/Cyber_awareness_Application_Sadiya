import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../models/education_topic.dart';
import '../services/language_service.dart';

class TopicDetailScreen extends StatefulWidget {
  final EducationTopic topic;

  const TopicDetailScreen({Key? key, required this.topic}) : super(key: key);

  @override
  _TopicDetailScreenState createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  FlutterTts tts = FlutterTts();
  String content = "";

  @override
  void initState() {
    super.initState();
    loadContent();
  }

  Future<void> loadContent() async {
    String lang = await LanguageService.getLanguage();

    if (lang == "hi") {
      content = widget.topic.contentHi;
      await tts.setLanguage("hi-IN");
    } else if (lang == "te") {
      content = widget.topic.contentTe;
      await tts.setLanguage("te-IN");
    } else {
      content = widget.topic.contentEn;
      await tts.setLanguage("en-IN");
    }

    setState(() {});
    speak();
  }

  Future<void> speak() async {
    await tts.setSpeechRate(0.4);
    await tts.awaitSpeakCompletion(true);
    await tts.speak(content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      appBar: AppBar(
        title: Text(widget.topic.title),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.volume_up),
            onPressed: speak,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            SizedBox(height: 20),

            if (widget.topic.quiz.isNotEmpty)
              Column(
                children: widget.topic.quiz.map((q) {
                  return Column(
                    children: [
                      Text(q.question,
                          style: TextStyle(color: Colors.white)),
                      ...q.options.asMap().entries.map((entry) {
                        return ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  entry.key == q.correctAnswer
                                      ? "Correct!"
                                      : "Wrong!",
                                ),
                              ),
                            );
                          },
                          child: Text(entry.value),
                        );
                      }).toList(),
                    ],
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}