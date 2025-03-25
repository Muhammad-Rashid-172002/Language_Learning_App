import 'package:flutter/material.dart';

class Lesson10 extends StatefulWidget {
  const Lesson10({super.key});

  @override
  State<Lesson10> createState() => _Lesson10State();
}

class _Lesson10State extends State<Lesson10> {
  int? selectedAnswer;
  List<Map<String, dynamic>> quizQuestions = [
    {
      "question": "How do you formally invite someone to an event?",
      "options": [
        "Hey, come over!",
        "Would you like to join us for dinner?",
        "See you there!",
        "Come if you want.",
      ],
      "correctIndex": 1,
    },
    {
      "question": "What is a polite way to accept an invitation?",
      "options": [
        "I guess I'll come.",
        "Nah, maybe next time.",
        "I'd love to, thank you!",
        "Whatever.",
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
        title: const Text("Lesson 10: Making & Accepting Invitations"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Making and accepting invitations is an important social skill. Here are common phrases you can use:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            commonPhrase(
              "Would you like to join us for dinner?",
              "Formal invitation",
            ),
            commonPhrase("Hey, want to grab a coffee?", "Casual invitation"),
            commonPhrase("I'd love to, thank you!", "Polite way to accept"),
            commonPhrase(
              "Sorry, I can't make it this time.",
              "Declining politely",
            ),
            const SizedBox(height: 20),

            const Text(
              "Dialogue Example",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Person 1: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        "Would you like to come to my birthday party this Saturday?\n",
                  ),

                  TextSpan(
                    text: "Person 2: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "I'd love to! What time?\n"),

                  TextSpan(
                    text: "Person 1: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "7 PM at my house.\n"),

                  TextSpan(
                    text: "Person 2: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "Great! I'll be there."),
                ],
              ),
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

  Widget commonPhrase(String phrase, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.blue, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "$phrase - $description",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
