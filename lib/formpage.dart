import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seance3/exerciepage.dart';
import 'package:seance3/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  String? myAddress ="";
  String? myPassword ="";

  String? error="no error";

  TextEditingController addressC=TextEditingController();
  TextEditingController PasswordC=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(title: const Text("Form Page"),centerTitle: true,),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 8),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("assets/img.jpg",width: 150,height:150),

              const Text("Login Page",style: TextStyle(color: Colors.black,fontSize: 42),),
              Text(error!,style: const TextStyle(color: Colors.red,fontSize: 36),),

              TextField(
                controller: addressC,
                decoration: const InputDecoration(
                    labelText: "Address",
                    labelStyle: TextStyle(fontSize: 22),
                    hintText: "Please write your Address"

                ),
                // onChanged: (String? address){
                //   print(address);
                //   myAddress=address;
                // },
              ),


              TextField(
                controller: PasswordC,
                decoration: const InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(fontSize: 22),
                    hintText: "Please write your Password"

                ),
                // onChanged: (String? password){
                //   myPassword=password;
                // },
              ),

              ElevatedButton(
                  onPressed: () async {
                    //method 1
                    // if(myAddress!.contains("@"))  {
                    //   print("correct address");
                    // }
                    // else{
                    //   print("not correct");
                    // }
                    //
                    // if(myPassword!.length> 3)  {
                    //   print("password correct ");
                    // }
                    // else{
                    //   print("password not correct");
                    // }

                    //method2

                    // if(addressC.text.contains("@"))  {
                    //    print("correct address");
                    //  }
                    //  else{
                    //    print("not correct");
                    //  }


                    // addressC.text= " ";

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Processing Data')),
                    // );

                    final box = GetStorage();
                    print(box.read('email'));


                    if(addressC.text !="mokhles@gmail.com") {
                      error="Incorrect address";
                      setState(() {
                      });
                      return;
                    }

                    if(PasswordC.text !="1234") {
                      error="Incorrect Password";
                      setState(() {
                      });
                      return;
                    }

                    error="";
                    setState(() {
                    });
                    // final SharedPreferences prefs = await SharedPreferences.getInstance();
                    // await prefs.setString('email', addressC.text);


                    box.write('email', addressC.text);



                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HomePage()));


                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}