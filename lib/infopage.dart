
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ListViewExample extends StatelessWidget {
  // Function to generate a random color
  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView.builder Example'),
      ),
      body: ListView.builder(
        itemCount: 5, // Number of items in the list
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            color: getRandomColor(), // Set random color
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}
