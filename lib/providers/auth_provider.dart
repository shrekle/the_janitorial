// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Positions {
  teacher,
  janitor,
  sub,
  aide,
  secretary,
  principle,
  otherStaff,
}

enum Schools {
  elementary,
  middle,
  high,
}

class Auth {
//
  var email = '';
  var password = '';
  var currentPositionString = '';
  var currentSchoolString = '';

  loadEnumItem(String enumItem) {
//
    const pos = Positions.values;
    const sch = Schools.values;

    pos.map(
      (value) {
        if (value.name == enumItem) {
          currentPositionString = enumItem;
          // return;
        }
      },
    );

    sch.map(
      (value) {
        if (value.name == enumItem) {
          currentSchoolString = enumItem;
          // return;
        }
      },
    );

    print('⚽️ $currentPositionString, $currentSchoolString');
  }

  submit(GlobalKey<FormState> key) {
//
    final isValid = key.currentState!.validate();

    if (isValid) {
      key.currentState!.save();
    } else {
      print('🤬 isValid check faliled');
    }
  }
}

final authProvider = Provider<Auth>((ref) {
  return Auth();
});

//use StateNotifier
// use ref.read outside the build method when you havea stateful widget, use ref.watch 
//inside the statefull widget(usually, maybe unless inside a call back)
// ref.read inside lifecylces state methos(initState) and inside func declrations