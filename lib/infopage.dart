
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Info"),
      ),

      body: Center(
        child: Text("My Info Page"),
      ),
    );
  }
}
