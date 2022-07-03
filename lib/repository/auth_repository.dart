import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

class AuthRepository{
  static final String url = "https://secure-sierra-64918.herokuapp.com";

  static Future<void> signUp(String email, String password, String confirmPassword) async {
    Response response = await http.post(Uri.parse(url + "signup"), body:{
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword
    });
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> signIn(String email, String password, String token) async {
    Response response = await http.post(Uri.parse(url + "/signin"), body:{
      "email": email,
      "password": password,
      "token": token
    });
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }
}