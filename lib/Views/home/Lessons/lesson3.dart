import 'package:flutter/material.dart';

class Lesson3 extends StatefulWidget {
  const Lesson3({super.key});

  @override
  State<Lesson3> createState() => _Lesson3State();
}

class _Lesson3State extends State<Lesson3> {
  int? selectedAnswer;
  List<Map<String, dynamic>> quizQuestions = [
    {
      "question": "What is the Spanish word for 'Five'?",
      "options": ["Tres", "Cinco", "Seis", "Ocho"],
      "correctIndex": 1,
    },
    {
      "question": "How do you say 'Ten' in German?",
      "options": ["Zehn", "Neun", "Elf", "Sieben"],
      "correctIndex": 0,
    },
  ];

  void checkAnswer(int index, int questionIndex) {
    setState(() {
      selectedAnswer = index;
    });

    String message =
        (index == quizQuestions[questionIndex]['correctIndex'])
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
        title: const Text("Lesson 3: Numbers & Counting"),
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
                  "Introduction",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Numbers are essential in any language. Learning how to count will help in daily conversations, from telling time to shopping.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Common Numbers List
            Row(
              children: [
                Icon(Icons.calculate),
                SizedBox(width: 5),
                const Text(
                  "Common Numbers",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            numberRow("One", "Uno", "Un", "Eins"),
            numberRow("Two", "Dos", "Deux", "Zwei"),
            numberRow("Three", "Tres", "Trois", "Drei"),
            numberRow("Four", "Cuatro", "Quatre", "Vier"),
            numberRow("Five", "Cinco", "Cinq", "Fünf"),
            numberRow("Six", "Seis", "Six", "Sechs"),
            numberRow("Seven", "Siete", "Sept", "Sieben"),
            numberRow("Eight", "Ocho", "Huit", "Acht"),
            numberRow("Nine", "Nueve", "Neuf", "Neun"),
            numberRow("Ten", "Diez", "Dix", "Zehn"),
            const SizedBox(height: 20),

            // Sample Dialogue
            const Text(
              " Conversation Example",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Person 1: How many apples do you have?\n"
              "Person 2: I have three apples.\n"
              "Person 1: Three? That's great!",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),

            // Quiz Section
            Row(
              children: [
                Icon(Icons.quiz_outlined),
                const Text(
                  " Quick Quiz",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
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
                                checkAnswer(value!, quizIndex);
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

  // Widget for displaying numbers in different languages
  Widget numberRow(
    String english,
    String spanish,
    String french,
    String german,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.numbers, color: Colors.blue, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "$english - $spanish (ES), $french (FR), $german (DE)",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
