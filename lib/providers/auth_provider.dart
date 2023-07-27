// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Positions { teacher, janitor, sub, aide, secretary, principle, otherStaff }

class Auth {
//

  var email = '';
  var password = '';
  var currentJobEnum = Positions.otherStaff;

  final List<String> jobDesciptions = [
    //have deez have a capital 1st letter like maximillian
    Positions.teacher.name,
    Positions.aide.name,
    Positions.secretary.name,
    Positions.principle.name,
    Positions.janitor.name,
    Positions.sub.name,
    Positions.otherStaff.name,
  ];

  submit(GlobalKey<FormState> key) {
//
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
