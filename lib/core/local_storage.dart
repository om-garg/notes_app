import 'package:shared_preferences/shared_preferences.dart';


class LocalStorage {
  Future<void> setEmail(String email) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", email);
  }

  Future<void> setPassword(String password) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("password", password);
  }

  Future<void> setJwt(String token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", token);
  }

  Future<String?> getEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("email");
  }

  Future<String?> getPassword() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("password");
  }

  Future<String?> getJwt() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  Future<void> removeEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("email");
  }

  Future<void> removePassword() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("password");
  }
}


