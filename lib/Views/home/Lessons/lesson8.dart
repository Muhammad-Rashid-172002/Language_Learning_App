import 'package:flutter/material.dart';

class Lesson8 extends StatefulWidget {
  const Lesson8({super.key});

  @override
  State<Lesson8> createState() => _Lesson8State();
}

class _Lesson8State extends State<Lesson8> {
  int? selectedAnswer;

  List<Map<String, dynamic>> quizQuestions = [
    {
      "question": "What phrase is commonly used to ask for directions?",
      "options": [
        "How much is this?",
        "Where is the nearest hotel?",
        "Can I have the menu?",
        "What time is it?",
      ],
      "correctIndex": 1,
    },
    {
      "question": "What does 'turn left' mean?",
      "options": [
        "Go straight ahead",
        "Make a right turn",
        "Change direction to the left",
        "Stop moving",
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
            ? "Correct! Good job!"
            : "Incorrect! Try again.";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 8: Travel & Directions"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Traveling and Asking \nfor Directions",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "When traveling, it's important to know how to ask for directions and understand responses. Common phrases and words can help you navigate easily.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.map),
                SizedBox(width: 5),
                const Text(
                  "Common Phrases for Directions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            commonPhrase(
              "Where is the nearest bus stop?",
              "Asking for the nearest bus stop",
            ),
            commonPhrase(
              "Can you show me on the map?",
              "Requesting directions on a map",
            ),
            commonPhrase("Turn left at the next street", "Giving directions"),
            commonPhrase(
              "Go straight ahead",
              "Telling someone to continue in a direction",
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

  Widget commonPhrase(String phrase, String meaning) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.blue, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "$phrase - $meaning",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
