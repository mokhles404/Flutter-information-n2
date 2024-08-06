import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final _firestore = FirebaseFirestore.instance;

  String noImg="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/800px-Image_not_available.png";
  Future<void> _deleteUser(String email) async {
    try {
      await _firestore.collection('users').doc(email).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete user: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final userEmail = user['email'];
              final userName = user['name'];
              final userAge = user['age'];
              final userImageUrl = (user.data() as Map<String,dynamic>).containsKey('image_url')? user['image_url'] :noImg;

              return ListTile(
                leading: userImageUrl != null
                    ? Image.network(userImageUrl, width: 50, height: 50)
                    : Icon(Icons.person),
                title: Text(userName),
                subtitle: Text('Age: $userAge\nEmail: $userEmail'),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteUser(userEmail),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
