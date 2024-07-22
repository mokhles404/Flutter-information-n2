

import 'package:flutter/material.dart';


class ExercisePage extends StatelessWidget {
  ExercisePage({super.key});

  String url ="https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjEwMzQtZWxlbWVudC0wNy00MDMucG5n.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("First Page"),
        centerTitle:true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Image.network(url),
          Text("Profile Name"),

          telAddressBar(),
          ElevatedButton( onPressed: () {

            Navigator.of(context).pop();
          },
          child: Text("backbtn"))
        ],
      ),

    );
  }

  Row telAddressBar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text("TEL: 23456765"),
            Icon(Icons.phone)
          ],
        ),

        Text("Tunisia sfax"),

      ],

    );
  }
}