import 'package:flutter/material.dart';

class Lesson2 extends StatefulWidget {
  const Lesson2({super.key});

  @override
  State<Lesson2> createState() => _Lesson2State();
}

class _Lesson2State extends State<Lesson2> {
  int? selectedAnswer;
  int correctAnswerIndex = 2; // Index of the correct answer

  List<Map<String, dynamic>> quizQuestions = [
    {
      "question": "What is the polite way to ask for help?",
      "options": [
        "Give me that!",
        "I don't care.",
        "Can you help me?",
        "Go away.",
      ],
      "correctIndex": 2,
    },
    {
      "question": "Which phrase is used to apologize?",
      "options": ["Thank you", "Excuse me", "Sorry", "You're welcome"],
      "correctIndex": 2,
    },
  ];

  void checkAnswer(int index) {
    setState(() {
      selectedAnswer = index;
    });

    String message =
        (index == quizQuestions[0]['correctIndex'])
            ? "✅ Correct! Well done."
            : "❌ Incorrect! Try again.";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 2: Common Phrases"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Introduction",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Using common phrases correctly is key to clear communication. "
              "These phrases help in everyday interactions, whether requesting something, apologizing, or expressing gratitude.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Essential Phrases
            Row(
              children: [
                Icon(Icons.record_voice_over),
                SizedBox(width: 5),
                const Text(
                  "Essential Common Phrases",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            commonPhrase("Excuse me", "To get attention or apologize"),
            commonPhrase("Please", "Used to make polite requests"),
            commonPhrase("Thank you", "To express gratitude"),
            commonPhrase("You're welcome", "A response to 'Thank you'"),
            commonPhrase("Sorry", "Used for apologizing"),
            commonPhrase("Can you help me?", "Asking for assistance"),
            commonPhrase("I don't understand", "Expressing confusion"),
            commonPhrase("How much does this cost?", "Asking about price"),
            commonPhrase("Where is the restroom?", "Asking for directions"),
            const SizedBox(height: 20),

            // Sample Dialogue
            const Text(
              "🗣️ Dialogue Example",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Person 1: Excuse me, can you help me?\n"
              "Person 2: Sure! What do you need?\n"
              "Person 1: Where is the nearest coffee shop?\n"
              "Person 2: Just go straight, then turn right.\n"
              "Person 1: Thank you!\n"
              "Person 2: You're welcome!",
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

  Widget commonPhrase(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
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
