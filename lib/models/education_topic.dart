import 'package:flutter/material.dart';

class EducationTopic {
  final int id;
  final String title;
  final String subtitle;
  final IconData icon;
  final String content;
  final List<QuizQuestion> quiz;

  EducationTopic({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.content,
    required this.quiz,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  QuizQuestion(this.question, this.options, this.correctAnswer);
}