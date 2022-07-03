import 'package:flutter/cupertino.dart';
import 'package:notes_app/repository/auth_repository.dart';

class AuthProvider extends ChangeNotifier{
  Future<bool> signUp(String email, String password, String confirmPassword) async {
    bool status = await AuthRepository.signUp(email, password, confirmPassword);
    return status;
  }

  Future<bool> signIn(String email, String password, String token) async {
    bool status = await AuthRepository.signIn(email, password, token);
    return status;
  }

  Future<void> signOut() async {
    await AuthRepository.signOut();
  }
}