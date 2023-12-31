import 'package:flutter/material.dart';
import 'package:the_janitorial/features/auth/presentation/login_screen/login/elements/login_form.dart';
import 'package:the_janitorial/features/auth/presentation/login_screen/logo.dart';
import 'package:the_janitorial/features/auth/presentation/login_screen/register/register_form.dart';
import 'package:the_janitorial/features/settings/presentation/settings_screen.dart';

class LoginHomeScreen extends StatelessWidget {
  const LoginHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
//
    return const
        // ScrollWheel();
        Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LogoImage(),
                // RegisterForm(),
                // LoginForm()
                SettingsScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
