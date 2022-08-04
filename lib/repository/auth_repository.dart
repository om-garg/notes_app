import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../core/local_storage.dart';
import '../core/messenger.dart';

class AuthRepository{
  static final String url = "https://secure-sierra-64918.herokuapp.com";

  static Future<bool> signUp(String email, String password, String confirmPassword) async {
    try{
      Response response = await http.post(Uri.parse(url + "/signup"), body:{
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword
      });
      var decoded = jsonDecode(response.body);
      log(decoded.toString(), name: "signUp Method");
      if(decoded["statusCode"] == 201) {
        LocalStorage localStorage = LocalStorage();
        localStorage.setEmail(email);
        localStorage.setPassword(password);
        localStorage.setJwt(decoded["token"]);
        return true;
      } else {
        Messenger.showSnackbar(decoded["message"] ?? "User already exist");
        return false;
      }
    } catch(e, s) {
      log(e.toString(), name: "signUp Method");
      print(s);
      return false;
    }
  }

  static Future<bool> signIn(String email, String password) async {
    try{
      String? token = await LocalStorage().getJwt();
      Response response = await http.post(Uri.parse(url + "/signin"), body:{
        "email": email,
        "password": password,
        "token": token
      });
      var decoded = jsonDecode(response.body);
      log(decoded.toString());
      if(decoded["statusCode"] == 200) {
        LocalStorage localStorage = LocalStorage();
        localStorage.setEmail(email);
        localStorage.setPassword(password);
        return true;
      } else {
        Messenger.showSnackbar(decoded["message"]);
        return false;
      }
    } catch(e, s) {
      log(e.toString(), name: "signIn Method");
      print(s);
      return false;
    }
  }

  static Future<void> signOut() async {
    LocalStorage storage = LocalStorage();
    storage.removeEmail();
    storage.removePassword();
  }
}