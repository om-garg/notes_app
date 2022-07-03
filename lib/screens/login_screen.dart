import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isSignUp = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          isSignUp ? "Sign Up" : "Sign In",
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
            isSignUp ? SizedBox(
              height: 20,
            ) : SizedBox(),
            isSignUp ? CustomTextField(
              controller: passwordController,
              labelText: "Confirm Password",
              obscure: true,
              hintText: "Confirm Password",
            ) : SizedBox(),
            SizedBox(
              height: 50,
            ),
            CustomButton(
                text: isSignUp ? "Sign Up" : "Sign In",
                onPress: (){},
            ),
            TextButton(
                onPressed: (){
                  setState(() {
                    isSignUp = !isSignUp;
                  });
                },
                child: Text(
                  isSignUp ? "Already have an account?" : "Don't have an account?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
