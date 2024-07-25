import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'formpage.dart';
import 'homePage.dart';

Future<void> main() async {
  await GetStorage.init();

  runApp( MyApp());
}



class MyApp extends StatelessWidget {
   MyApp({super.key});
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: box.read('email')!= null && box.read('email').isNotEmpty ?
      HomePage()
      :LoginPage(),
    );
  }
}



/*
//method 1
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Widget? mypage;

  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    if (email != null && email.isNotEmpty) {
      mypage=HomePage();
      setState(() {

      });
    } else {
      mypage=LoginPage();
      setState(() {

      });

    }
  }



  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Seance 3',
      home: mypage ==null ?
        Scaffold(
        body: Center(child: CircularProgressIndicator()),
      )
      :mypage
      ,

    );
  }
}
*/









