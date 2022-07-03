import 'package:flutter/material.dart';
import 'package:notes_app/model/provider/auth_provider.dart';
import 'package:notes_app/screens/add_notes_screen.dart';
import 'package:notes_app/widgets/notes_list.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'Flutter Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthProvider>().signOut();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(
                isUpdate: false,
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.lightBlue,
          size: 30,
        ),
      ),
      body: NotesList(),
    );
  }
}
