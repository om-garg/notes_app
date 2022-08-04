import 'package:flutter/cupertino.dart';
import 'package:notes_app/repository/auth_repository.dart';

import 'notes_provider.dart';

class AuthProvider extends ChangeNotifier{
  bool _isSignUp = false;
  bool _isLoading = false;

  bool get isSignUp => _isSignUp;
  bool get isLoading => _isLoading;

  void toggle(){
    _isSignUp = !_isSignUp;
    notifyListeners();
  }

  void setIsLoading(){
    _isLoading = !_isLoading;
    notifyListeners();
  }

  Future<bool> signUp(String email, String password, String confirmPassword) async {
    bool status = await AuthRepository.signUp(email, password, confirmPassword);
    return status;
  }

  Future<bool> signIn(String email, String password) async {
    bool status = await AuthRepository.signIn(email, password);
    return status;
  }

  Future<void> signOut() async {
    NotesProvider().clearNoteList();
    await AuthRepository.signOut();
  }
}