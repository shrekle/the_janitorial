// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Auth {
//
  var email = '';
  var password = '';

  // i may have to create the key here and use it in loginForm through the provider
  submit(GlobalKey<FormState> key) {
    final isValid = key.currentState!.validate();

    if (isValid) {
      key.currentState!.save();
    } else {
      print('🤬 isValid check faliled');
    }
  }

  printTF() {
    print('♥︎ $email, $password');
  }
}

final authProvider = Provider<Auth>((ref) {
  return Auth();
});
