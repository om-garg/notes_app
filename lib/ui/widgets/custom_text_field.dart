import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscure;
  final String hintText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.obscure,
    required this.hintText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white,
      obscureText: obscure,
      obscuringCharacter: "*",
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white54,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 1, color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 1, color: Colors.white)),
      ),
    );
  }
}
