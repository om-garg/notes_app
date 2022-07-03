import 'package:flutter/material.dart';
import 'package:notes_app/core/local_storage.dart';
import 'package:notes_app/core/messenger.dart';
import 'package:notes_app/model/provider/notes_provider.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../model/provider/auth_provider.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, _) {
        return Scaffold(
          backgroundColor: Colors.lightBlue,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            title: Text(
              value.isSignUp ? "Sign Up" : "Sign In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                    controller: emailController,
                    labelText: "Email Address",
                    obscure: false,
                    hintText: "abs@gmail.com",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: passwordController,
                  labelText: "Password",
                  obscure: true,
                  hintText: "Password",
                ),
                value.isSignUp ? SizedBox(
                  height: 20,
                ) : SizedBox(),
                value.isSignUp ? CustomTextField(
                  controller: confirmPasswordController,
                  labelText: "Confirm Password",
                  obscure: true,
                  hintText: "Confirm Password",
                ) : SizedBox(),
                SizedBox(
                  height: 50,
                ),
              CustomButton(
                isLoading: value.isLoading,
                text: value.isSignUp ? "Sign Up" : "Sign In",
                onPress: () async {
                  value.setIsLoading();
                  if(value.isSignUp){
                    bool status =  await value.signUp(emailController.text, passwordController.text, confirmPasswordController.text);
                    if(status) {
                      LocalStorage().setEmail(emailController.text);
                      context.read<NotesProvider>().setUserId((await LocalStorage().getEmail())!);
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
                    } else {
                      Messenger.showSnackbar("Error!!!");
                    }
                  } else {
                    bool status =  await value.signIn(emailController.text, passwordController.text);
                    if(status) {
                      LocalStorage().setEmail(emailController.text);
                      context.read<NotesProvider>().setUserId((await LocalStorage().getEmail())!);
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
                    } else {
                      Messenger.showSnackbar("Error!!!");
                    }
                  }
                  value.setIsLoading();
                },
              ),
                TextButton(
                  onPressed: (){
                    value.toggle();
                  },
                  child: Text(
                    value.isSignUp ? "Already have an account?" : "Don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
