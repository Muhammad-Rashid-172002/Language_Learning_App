import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_app/Views/home/Lessons/lesson1.dart';
import 'package:language_app/Views/home/Lessons/lesson10.dart';
import 'package:language_app/Views/home/Lessons/lesson2.dart';
import 'package:language_app/Views/home/Lessons/lesson3.dart';
import 'package:language_app/Views/home/Lessons/lesson4.dart';
import 'package:language_app/Views/home/Lessons/lesson5.dart';
import 'package:language_app/Views/home/Lessons/lesson6.dart';
import 'package:language_app/Views/home/Lessons/lesson7.dart';
import 'package:language_app/Views/home/Lessons/lesson8.dart';
import 'package:language_app/Views/home/Lessons/lesson9.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final List lessons = [
    {'title': 'Lesson 1: Basic Greetings', 'page': Lesson1()},
    {'title': 'Lesson 2: Common Phrases', 'page': Lesson2()},
    {'title': 'Lesson 3: Numbers & Counting', 'page': Lesson3()},
    {'title': 'Lesson 4: Simple Sentences', 'page': Lesson4()},
    {'title': 'Lesson 5: Family & Relationships', 'page': Lesson5()},
    {'title': 'Lesson 6: Days, Months & Time', 'page': Lesson6()},
    {'title': 'Lesson 7: Food & Dining', 'page': Lesson7()},
    {'title': 'Lesson 8: Travel & Directions', 'page': Lesson8()},
    {'title': 'Lesson 9: Expressing Opinions & Feelings', 'page': Lesson9()},
    {'title': 'Lesson 10: Making & Accepting Invitations', 'page': Lesson10()},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons', style: GoogleFonts.aclonica()),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              lessons[index]['title'],
              style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
            ),
            leading: Image.asset('assets/images/book.jpg'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => lessons[index]['page']),
              );
            },
          );
        },
      ),
    );
  }
}
