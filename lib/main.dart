import 'package:flutter/material.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'model/notes_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesData(),
      child: MaterialApp(
        title: 'Flutter Notes',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
