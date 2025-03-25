import 'package:flutter/material.dart';

class Lesson7 extends StatefulWidget {
  const Lesson7({super.key});

  @override
  State<Lesson7> createState() => _Lesson7State();
}

class _Lesson7State extends State<Lesson7> {
  int? selectedAnswer;

  List<Map<String, dynamic>> quizQuestions = [
    {
      "question": "What is a common phrase to order food at a restaurant?",
      "options": [
        "Give me food",
        "I want food",
        "Can I have the menu, please?",
        "Food now",
      ],
      "correctIndex": 2,
    },
    {
      "question": "Which of these is a common dining etiquette?",
      "options": [
        "Chew with your mouth open",
        "Talk loudly while eating",
        "Say 'Thank you' to the waiter",
        "Put your elbows on the table",
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
        title: const Text("Lesson 7: Food & Dining"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              " Food & Dining",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Ordering food and dining etiquette are important in everyday life, whether at a restaurant or dining with friends.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              " Common Phrases for Ordering Food",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            commonPhrase("Can I see the menu, please?", "Requesting a menu"),
            commonPhrase("I’d like to order...", "Placing an order"),
            commonPhrase("Could you bring me...?", "Requesting an item"),
            commonPhrase("How much does it cost?", "Asking for the price"),
            commonPhrase("The bill, please.", "Asking for the check"),
            const SizedBox(height: 20),

            const Text(
              " Sample Dialogue",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Customer: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "Hello! Can I see the menu, please?\n"),

                  TextSpan(
                    text: "Waiter: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "Of course! Here you go.\n"),

                  TextSpan(
                    text: "Customer: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "I’d like to order a burger and a soda.\n"),

                  TextSpan(
                    text: "Waiter: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "Great choice! Anything else?\n"),

                  TextSpan(
                    text: "Customer: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "No, that will be all. How much does it cost?\n",
                  ),

                  TextSpan(
                    text: "Waiter: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "That will be \$10.\n"),

                  TextSpan(
                    text: "Customer: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "Here you go. Thank you!\n"),

                  TextSpan(
                    text: "Waiter: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "You're welcome. Enjoy your meal!"),
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
