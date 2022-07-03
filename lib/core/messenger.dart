import 'package:flutter/material.dart';

import '../main.dart';

class Messenger {
  static void showSnackbar(String message) {
    ScaffoldMessenger.of(navigationKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
