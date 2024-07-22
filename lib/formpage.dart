import 'package:flutter/material.dart';
import 'package:seance3/exerciepage.dart';



class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {


  String? myAddress ="";
  String? myPassword ="";

  String? error="no error";

  TextEditingController addressC=TextEditingController();
  TextEditingController PasswordC=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(title: Text("Form Page"),centerTitle: true,),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 32,vertical: 8),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset("assets/img.jpg",width: 150,height:150),

            Text("Login Page",style: TextStyle(color: Colors.black,fontSize: 42),),
            Text(error!,style: TextStyle(color: Colors.red,fontSize: 36),),

            TextField(
              controller: addressC,
              decoration: InputDecoration(
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
              decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 22),
                  hintText: "Please write your Password"

              ),
              // onChanged: (String? password){
              //   myPassword=password;
              // },
            ),

            ElevatedButton(
                onPressed: () {
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

                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ExercisePage()));


                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}