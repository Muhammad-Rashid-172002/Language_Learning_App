import 'package:flutter/material.dart';
import 'package:language_app/Views/home/LessonScreen.dart';
import 'package:language_app/Views/home/QuizScreen.dart';
import 'package:language_app/Views/home/progressScreen.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int _selectedIndex = 0; // Track the selected tab

  // List of screens for navigation
  final List<Widget> _screens = [
    LessonScreen(),
    QuizScreen(),
    ProgressScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Change the selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body changes based on selected index
      body: _screens[_selectedIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Lessons',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}
