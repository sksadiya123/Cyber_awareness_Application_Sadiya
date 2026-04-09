import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/education_topic.dart';
import '../services/bookmark_service.dart';

class TopicDetailScreen extends StatefulWidget {
  final EducationTopic topic;

  const TopicDetailScreen({Key? key, required this.topic}) : super(key: key);

  @override
  _TopicDetailScreenState createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  bool showQuiz = false;
  int currentQuestionIndex = 0;
  int? selectedAnswer;
  int score = 0;
  bool quizCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic.title),
        actions: [
          Consumer<BookmarkService>(
            builder: (context, bookmarkService, child) {
              final isBookmarked = bookmarkService.isBookmarked(widget.topic.id);
              return IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked ? Colors.yellow[700] : null,
                ),
                onPressed: () {
                  bookmarkService.toggleBookmark(widget.topic.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isBookmarked ? 'Bookmark removed' : 'Bookmark added',
                      ),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                'Check out this cybersecurity tip: ${widget.topic.title}\n\n'
                '${widget.topic.subtitle}\n\n'
                'Stay safe online!',
                subject: 'Cybersecurity Tip: ${widget.topic.title}',
              );
            },
          ),
        ],
      ),
      body: showQuiz ? _buildQuizView() : _buildContentView(),
      bottomNavigationBar: !showQuiz && widget.topic.quiz.isNotEmpty
          ? Container(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showQuiz = true;
                  });
                },
                child: Text('Take Quiz'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildContentView() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Topic Header
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                radius: 30,
                child: Icon(
                  widget.topic.icon,
                  size: 30,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.topic.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.topic.subtitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          SizedBox(height: 24),
          
          // Content
          Container(
            width: double.infinity,
            child: _buildMarkdownContent(widget.topic.content),
          ),
          
          SizedBox(height: 24),
          
          // Progress indicator
          if (widget.topic.quiz.isNotEmpty)
            Card(
              color: Colors.green[50],
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.quiz, color: Colors.green[700]),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Test your knowledge with ${widget.topic.quiz.length} questions',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMarkdownContent(String content) {
    final lines = content.split('\n');
    final widgets = <Widget>[];
    
    for (final line in lines) {
      if (line.startsWith('# ')) {
        widgets.add(Padding(
          padding: EdgeInsets.only(top: 16, bottom: 8),
          child: Text(
            line.substring(2),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
          ),
        ));
      } else if (line.startsWith('## ')) {
        widgets.add(Padding(
          padding: EdgeInsets.only(top: 12, bottom: 6),
          child: Text(
            line.substring(3),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue[700],
            ),
          ),
        ));
      } else if (line.startsWith('- ') || line.startsWith('• ')) {
        widgets.add(Padding(
          padding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('• ', style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text(
                  line.substring(2),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ));
      } else if (line.startsWith('**') && line.endsWith('**') && line.length > 4) {
        widgets.add(Padding(
          padding: EdgeInsets.only(top: 8, bottom: 4),
          child: Text(
            line.substring(2, line.length - 2),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
      } else if (line.startsWith('✅ ') || line.startsWith('❌ ') || 
                 line.startsWith('🚩 ') || line.startsWith('⚠️ ') ||
                 line.startsWith('🚨 ')) {
        widgets.add(Padding(
          padding: EdgeInsets.only(top: 4, bottom: 4, left: 8),
          child: Text(
            line,
            style: TextStyle(fontSize: 16),
          ),
        ));
      } else if (line.trim().isNotEmpty) {
        widgets.add(Padding(
          padding: EdgeInsets.only(top: 4, bottom: 4),
          child: Text(
            line,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ));
      } else {
        widgets.add(SizedBox(height: 8));
      }
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  Widget _buildQuizView() {
    if (quizCompleted) {
      return _buildQuizResults();
    }
    
    final question = widget.topic.quiz[currentQuestionIndex];
    
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress indicator
          LinearProgressIndicator(
            value: (currentQuestionIndex + 1) / widget.topic.quiz.length,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[600]!),
          ),
          
          SizedBox(height: 20),
          
          Text(
            'Question ${currentQuestionIndex + 1} of ${widget.topic.quiz.length}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          
          SizedBox(height: 16),
          
          Text(
            question.question,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          SizedBox(height: 24),
          
          // Answer options
          ...question.options.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            
            return Card(
              margin: EdgeInsets.only(bottom: 8),
              child: RadioListTile<int>(
                value: index,
                groupValue: selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    selectedAnswer = value;
                  });
                },
                title: Text(option),
              ),
            );
          }).toList(),
          
          Spacer(),
          
          // Navigation buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    showQuiz = false;
                    currentQuestionIndex = 0;
                    selectedAnswer = null;
                    score = 0;
                    quizCompleted = false;
                  });
                },
                child: Text('Back to Content'),
              ),
              ElevatedButton(
                onPressed: selectedAnswer != null ? _nextQuestion : null,
                child: Text(
                  currentQuestionIndex == widget.topic.quiz.length - 1
                      ? 'Finish Quiz'
                      : 'Next Question',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuizResults() {
    final percentage = (score / widget.topic.quiz.length * 100).round();
    
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            percentage >= 70 ? Icons.check_circle : Icons.cancel,
            size: 100,
            color: percentage >= 70 ? Colors.green : Colors.orange,
          ),
          
          SizedBox(height: 24),
          
          Text(
            'Quiz Complete!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          SizedBox(height: 16),
          
          Text(
            'Your Score: $score/${widget.topic.quiz.length} ($percentage%)',
            style: TextStyle(
              fontSize: 20,
              color: percentage >= 70 ? Colors.green[700] : Colors.orange[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          
          SizedBox(height: 16),
          
          Text(
            percentage >= 70
                ? '🎉 Great job! You understand this topic well.'
                : '💪 Good effort! Review the content and try again to improve.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          
          SizedBox(height: 32),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showQuiz = false;
                    currentQuestionIndex = 0;
                    selectedAnswer = null;
                    score = 0;
                    quizCompleted = false;
                  });
                },
                child: Text('Back to Content'),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    currentQuestionIndex = 0;
                    selectedAnswer = null;
                    score = 0;
                    quizCompleted = false;
                  });
                },
                child: Text('Retake Quiz'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _nextQuestion() {
    // Check if answer is correct
    if (selectedAnswer == widget.topic.quiz[currentQuestionIndex].correctAnswer) {
      score++;
    }
    
    if (currentQuestionIndex < widget.topic.quiz.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
      });
    } else {
      setState(() {
        quizCompleted = true;
      });
    }
  }
}