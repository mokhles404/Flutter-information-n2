// home_page.dart
import 'package:flutter/material.dart';
import 'package:seance3/stackPage.dart';

import 'exerciepage.dart';
import 'formpage.dart';
import 'infopage.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
     ListViewExample(),
    // const FormPage(),
    ExercisePage(),
     StackPage()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.info,color: Colors.purple,),
              label: 'My Info',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.login,color: Colors.purple,),
            //   label: 'Login',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center,color: Colors.purple,),
              label: 'Exercise',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.purple,),
              label: 'Test',
            ),
          ],
        ),
      ),
    );
  }
}




