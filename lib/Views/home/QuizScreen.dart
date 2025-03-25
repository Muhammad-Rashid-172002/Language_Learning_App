import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;

  List<Map<String, Object>> questions = [
    {
      'questionText': 'How do you say "Hello" in Spanish?',
      'answers': ['Hola', 'Adios', 'Gracias', 'Por favor'],
      'correctAnswer': 'Hola',
    },
    {
      'questionText': 'What is "Thank you" in French?',
      'answers': ['Bonjour', 'Merci', 'Oui', 'Non'],
      'correctAnswer': 'Merci',
    },
    {
      'questionText': 'What is "Goodbye" in German?',
      'answers': ['Hallo', 'Tschüss', 'Bitte', 'Danke'],
      'correctAnswer': 'Tschüss',
    },
    {
      'questionText': 'Which language is spoken in Brazil?',
      'answers': ['Spanish', 'Portuguese', 'French', 'Italian'],
      'correctAnswer': 'Portuguese',
    },
    {
      'questionText': 'How do you say "Yes" in Italian?',
      'answers': ['No', 'Si', 'Oui', 'Ja'],
      'correctAnswer': 'Si',
    },
  ];

  void _nextQuestion(String selectedAnswer) {
    if (selectedAnswer == questions[_questionIndex]['correctAnswer']) {
      _score++;
    }

    setState(() {
      if (_questionIndex < questions.length - 1) {
        _questionIndex++;
      } else {
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Quiz Completed!'),
            content: Text('You scored $_score out of ${questions.length}.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _restartQuiz();
                },
                child: const Text('Restart Quiz'),
              ),
            ],
          ),
    );
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz'), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[_questionIndex]['questionText'] as String,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...(questions[_questionIndex]['answers'] as List<String>).map((
              answer,
            ) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () => _nextQuestion(answer),
                  child: Text(answer),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
