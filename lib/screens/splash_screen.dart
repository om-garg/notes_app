import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notes_app/core/local_storage.dart';
import 'package:notes_app/model/provider/auth_provider.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../model/provider/notes_provider.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() async {
    LocalStorage localStorage = LocalStorage();

    String? email = await localStorage.getEmail();
    String? password = await localStorage.getPassword();

    log(email.toString(), name: "Splash screen Email");
    log(password.toString(), name: "Splash screen Password");

    if(email == null && password == null) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
    } else {
      bool status = await context.read<AuthProvider>().signIn(email!, password!);
      if(status){
        context.read<NotesProvider>().setUserId(email);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
