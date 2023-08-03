import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_janitorial/providers/auth_provider.dart';

class BuildPrimaryButton extends StatelessWidget {
  const BuildPrimaryButton({
    super.key,
    required this.authVM,
    required this.formKey,
    required this.text,
  });

  final Auth authVM;
  final GlobalKey<FormState> formKey;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(180, 40),
      ),
      onPressed: () {
        authVM.submit(formKey);
      },
      child: Text(text),
    );
  }
}
