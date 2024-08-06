import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _name = '';
  String _age = '';
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {

    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image != null ? File(image.path) : null;
    });
  }

  Future<void> _register() async {
    print(_image?.path);
    // return;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        // Store image in Firebase Storage
        String imageUrl = '';
        if (_image != null) {
          final ref = _storage
              .ref()
              .child('user_images')
              .child(_email + '.jpg');
          await ref.putFile(_image!);
          imageUrl = await ref.getDownloadURL();
        }

        // Store user data in Firestore
        await _firestore.collection('users').doc(_email).set({
          'email': _email,
          'password': _password,
          'name': _name,
          'age': _age,
          'image_url': imageUrl,
        });
        Navigator.of(context).pop();

        // Navigate to another screen or show a success message
      } catch (e) {
        // Handle error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _image == null
                    ? Text('No image selected')
                    : 
                
                InkWell(
                  onTap: (){
                    print("Image function done");
                  },
                  onDoubleTap: (){
                    print("Double Image function done");
                  },
                  onLongPress: () async {
                    await _pickImage();
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(600),
                      child: Image.file(_image!, height: 100,width: 100,fit: BoxFit.fill,)),
                ),
                
                SizedBox(height: 22),
            
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => _email = value!,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (value) => _password = value!,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onSaved: (value) => _name = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _age = value!,
                  validator: (value) {
                    if (value!.isEmpty || int.tryParse(value!) == null) {
                      return 'Please enter a valid age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),
            
                InkWell(
                   onTap: (){
                     print("you click on text");
                   },
                    child: Text("Upload Image from Text")),
            
                SizedBox(height: 16),
            
                InkWell(
                    onDoubleTap: (){
                      print("Container clicked by double tap");
                    },
                    child: Container(color: Colors.blue,width: 50,height: 50,)),
                SizedBox(height: 32),
            
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Upload Profile Image'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _register,
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
