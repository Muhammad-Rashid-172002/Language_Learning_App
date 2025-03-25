import 'package:flutter/material.dart';

class Lesson9 extends StatelessWidget {
  const Lesson9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 9: Expressing Opinions & Feelings"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Lesson 9: Expressing Opinions & Feelings",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Being able to express your thoughts, opinions, and feelings is crucial in communication. In this lesson, you'll learn different ways to share how you feel and what you think.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Common Expressions
            const Text(
              "Common Phrases for Expressing Opinions:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            commonPhrase("I think that...", "Used to express an opinion."),
            commonPhrase(
              "In my opinion...",
              "A formal way to state an opinion.",
            ),
            commonPhrase(
              "I believe...",
              "Used when you're confident in your opinion.",
            ),
            commonPhrase(
              "From my perspective...",
              "Explaining a personal viewpoint.",
            ),
            const SizedBox(height: 20),

            const Text(
              "Common Phrases for Expressing Feelings:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            commonPhrase("I'm feeling happy.", "Expressing positive emotions."),
            commonPhrase("I'm a bit worried about...", "Expressing concern."),
            commonPhrase("I feel really excited!", "Showing enthusiasm."),
            commonPhrase("I'm upset because...", "Sharing negative emotions."),
            const SizedBox(height: 20),

            // Dialogue Example
            const Text(
              "Example Dialogue:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Person 1: What do you think about the new project?\n"
              "Person 2: In my opinion, it's a great idea. It will help a lot of people.\n"
              "Person 1: Yeah, I think so too. I'm feeling really excited about it!",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),

            // Quiz Section
            const Text(
              " Quick Quiz",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            QuizSection(),
          ],
        ),
      ),
    );
  }

  // Widget for displaying common phrases
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

// Quiz Section Widget
class QuizSection extends StatefulWidget {
  @override
  _QuizSectionState createState() => _QuizSectionState();
}

class _QuizSectionState extends State<QuizSection> {
  int? selectedAnswer;
  List<Map<String, dynamic>> quizQuestions = [
    {
      "question": "Which phrase is used to express an opinion?",
      "options": [
        "I'm happy",
        "I think that...",
        "Good morning",
        "See you later",
      ],
      "correctIndex": 1,
    },
    {
      "question": "How can you express excitement?",
      "options": [
        "I'm a bit worried",
        "I'm upset",
        "I'm feeling excited!",
        "I believe...",
      ],
      "correctIndex": 2,
    },
  ];

  void checkAnswer(int index, int quizIndex) {
    setState(() {
      selectedAnswer = index;
    });

    String message =
        (index == quizQuestions[quizIndex]['correctIndex'])
            ? "Correct! Well done."
            : "Incorrect! Try again.";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(quizQuestions.length, (quizIndex) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q: ${quizQuestions[quizIndex]['question']}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Column(
              children: List.generate(
                quizQuestions[quizIndex]['options'].length,
                (index) {
                  return ListTile(
                    title: Text(quizQuestions[quizIndex]['options'][index]),
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
    );
  }
}
