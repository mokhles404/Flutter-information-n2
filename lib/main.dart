import 'package:flutter/material.dart';

import 'exerciepage.dart';
import 'formpage.dart';
import 'homePage.dart';
import 'infopage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seance 3',
      home: HomePage(),
    );
  }
}










