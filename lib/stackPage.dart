import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seance3/formpage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StackPage extends StatelessWidget {
   StackPage({super.key});

  @override
  Widget build(BuildContext context) {

    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Stack Page"),),

      body: Container(
        color: Colors.black,
        width: size.width *0.7,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            stackMethod(),

            SizedBox(height: 16,),
            Container(
              width: 140,
              height: 140,
              color: Colors.amber,),

            ElevatedButton(onPressed: () async {
              // final SharedPreferences prefs = await SharedPreferences.getInstance();
              //
              // // Remove data for the 'counter' key.
              // await prefs.remove('email');

              final box = GetStorage();
              print(box.read('email'));
              // return;
              box.remove('email');

              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>LoginPage()));
            }, child: Text("Logout"))
          ],
        ),
      ),
    );
  }

  Stack stackMethod() {
    return Stack(
            children: [
              Container(
                width: 140,
                height: 140,
                color: Colors.indigo,),


              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                      borderRadius: BorderRadius.circular(360)
                ),
                width: 18,
                height: 18,
              ),
              Positioned(
                left: 10,
                bottom: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                        borderRadius: BorderRadius.circular(360)
                  ),
                  width: 18,
                  height: 18,
                ),
              ),
            ],
          );
  }
}