import 'package:flutter/material.dart';

class Lesson5 extends StatefulWidget {
  const Lesson5({super.key});

  @override
  State<Lesson5> createState() => _Lesson5State();
}

class _Lesson5State extends State<Lesson5> {
  int? selectedAnswer;
  List<Map<String, dynamic>> quizQuestions = [
    {
      "question": "What is the term for your mother's sister?",
      "options": ["Cousin", "Aunt", "Niece", "Grandmother"],
      "correctIndex": 1,
    },
    {
      "question": "How do you refer to the son of your brother?",
      "options": ["Uncle", "Nephew", "Grandson", "Cousin"],
      "correctIndex": 1,
    },
  ];

  void checkAnswer(int index, int correctIndex) {
    setState(() {
      selectedAnswer = index;
    });

    String message =
        (index == correctIndex)
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
        title: const Text("Lesson 5: Family & Relationships"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const Text(
              "Family relationships are an important part of daily communication. Knowing how to refer to family members correctly is essential.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            commonTerm("Father", "The male parent"),
            commonTerm("Mother", "The female parent"),
            commonTerm("Son", "A male child"),
            commonTerm("Daughter", "A female child"),
            commonTerm("Brother", "A male sibling"),
            commonTerm("Sister", "A female sibling"),
            commonTerm("Uncle", "The brother of one’s parent"),
            commonTerm("Aunt", "The sister of one’s parent"),
            commonTerm("Cousin", "The child of one’s uncle or aunt"),
            commonTerm("Grandfather", "The father of one’s parent"),
            commonTerm("Grandmother", "The mother of one’s parent"),
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
                                checkAnswer(
                                  value!,
                                  quizQuestions[quizIndex]['correctIndex'],
                                );
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

  Widget commonTerm(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.family_restroom, color: Colors.blue, size: 20),
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
