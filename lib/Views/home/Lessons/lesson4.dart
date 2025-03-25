import 'package:flutter/material.dart';

class Lesson4 extends StatefulWidget {
  const Lesson4({super.key});

  @override
  State<Lesson4> createState() => _Lesson4State();
}

class _Lesson4State extends State<Lesson4> {
  int? selectedAnswer;
  int correctAnswerIndex = 2;

  List<Map<String, dynamic>> quizQuestions = [
    {
      "question": "Which sentence is grammatically correct?",
      "options": [
        "She going to the market.",
        "She go to the market.",
        "She is going to the market.",
        "She goes the market.",
      ],
      "correctIndex": 2,
    },
    {
      "question": "Which sentence is in past tense?",
      "options": [
        "I am eating dinner.",
        "I will eat dinner.",
        "I ate dinner.",
        "I eats dinner.",
      ],
      "correctIndex": 2,
    },
  ];

  void checkAnswer(int index) {
    setState(() {
      selectedAnswer = index;
    });

    String message =
        (index == quizQuestions[0]['correctIndex'])
            ? "Correct! Well done."
            : "Incorrect! Try again.";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 4: Simple Sentences"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Introduction",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Simple sentences contain a subject and a verb. They express a complete thought.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Examples of Simple Sentences:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            simpleSentence("She reads a book."),
            simpleSentence("The sun is shining."),
            simpleSentence("He likes to play football."),
            simpleSentence("They went to the park."),
            simpleSentence("I love ice cream."),
            const SizedBox(height: 20),
            const Text(
              "Dialogue Example:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Person 1: What are you doing?\n"
              "Person 2: I am reading a book.\n"
              "Person 1: Is it interesting?\n"
              "Person 2: Yes, it's very interesting!",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            const Text(
              " Quick Quiz",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(quizQuestions.length, (quizIndex) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q: ${quizQuestions[quizIndex]['question']}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Column(
                      children: List.generate(
                        quizQuestions[quizIndex]['options'].length,
                        (index) {
                          return ListTile(
                            title: Text(
                              quizQuestions[quizIndex]['options'][index],
                            ),
                            leading: Radio<int>(
                              value: index,
                              groupValue: selectedAnswer,
                              onChanged: (int? value) {
                                checkAnswer(value!);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget simpleSentence(String sentence) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.blue, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(sentence, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
