import 'package:flutter/material.dart';

class Lesson6 extends StatefulWidget {
  const Lesson6({super.key});

  @override
  State<Lesson6> createState() => _Lesson6State();
}

class _Lesson6State extends State<Lesson6> {
  int? selectedAnswer;

  List<Map<String, dynamic>> quizQuestions = [
    {
      "question": "What is the first day of the week?",
      "options": ["Monday", "Sunday", "Wednesday", "Friday"],
      "correctIndex": 1,
    },
    {
      "question": "How many days are in a leap year?",
      "options": ["365", "366", "364", "367"],
      "correctIndex": 1,
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
        title: const Text("Lesson 6: Days, Months & Time"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 5),
                const Text(
                  "Understanding Time & Dates",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            commonInfo("Monday", "The first day of the week."),
            commonInfo("February", "The shortest month of the year."),
            commonInfo("12:00 PM", "Midday or noon."),
            commonInfo("7:00 AM", "A common wake-up time."),
            const SizedBox(height: 20),

            // Sample Dialogue
            const Text(
              "Dialogue Example",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Person 1: What day is today?\n"
              "Person 2: Today is Wednesday.\n"
              "Person 1: What time is it?\n"
              "Person 2: It’s 3:00 PM.",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),

            // Quiz Section
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

  // Widget for displaying information
  Widget commonInfo(String title, String description) {
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
