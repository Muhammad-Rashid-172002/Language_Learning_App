import 'package:flutter/material.dart';

class Lesson1 extends StatefulWidget {
  const Lesson1({super.key});

  @override
  State<Lesson1> createState() => _Lesson1State();
}

class _Lesson1State extends State<Lesson1> {
  int? selectedAnswer;
  int correctAnswerIndex = 1; // Index of the correct answer for the quiz

  List<Map<String, dynamic>> quizQuestions = [
    {
      "question":
          "What is the most formal way to greet someone in the morning?",
      "options": ["Hi", "Good morning", "What's up", "Bye"],
      "correctIndex": 1,
    },
    {
      "question": "How would you respond to 'Nice to meet you'?",
      "options": [
        "Thank you",
        "Goodbye",
        "Nice to meet you too",
        "See you later",
      ],
      "correctIndex": 2,
    },
  ];

  void checkAnswer(int index) {
    setState(() {
      selectedAnswer = index;
    });

    // Show a message based on the selected answer
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
        title: const Text("Lesson 1: Basic Greetings"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lesson Title
            Row(
              children: [
                Container(
                  height: 50,
                  child: Image.asset('assets/images/book1.png'),
                ),
                const Text(
                  "Introduction",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Greetings are the foundation of any conversation. Whether you're meeting someone new or greeting a friend, knowing how to say hello is important.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Greetings List
            Row(
              children: [
                Icon(Icons.record_voice_over),
                SizedBox(width: 5),
                const Text(
                  "Common Greetings",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            commonGreeting("Hello", "A general greeting"),
            commonGreeting("Hi", "An informal greeting"),
            commonGreeting("Good morning", "Used in the morning"),
            commonGreeting("Good afternoon", "Used in the afternoon"),
            commonGreeting("Good evening", "Used in the evening"),
            commonGreeting("Good night", "Used before sleeping"),
            commonGreeting("How are you?", "Asking about well-being"),
            const SizedBox(height: 20),

            // Sample Dialogue
            const Text(
              " Dialogue Example",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              " Person 1: Hello! How are you?\n"
              " Person 2: Hi! I'm doing well, thanks. How about you?\n"
              " Person 1: I'm great! Nice to meet you.\n"
              " Person 2: Nice to meet you too!",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),

            // Quiz Section
            const Text(
              "📝 Quick Quiz",
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

  // Widget for displaying greetings
  Widget commonGreeting(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.blue, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "$title - $description",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
