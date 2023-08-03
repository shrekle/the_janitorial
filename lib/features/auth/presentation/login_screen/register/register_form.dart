// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:the_janitorial/common_widgets/textfield_widget.dart';
import 'package:the_janitorial/features/auth/presentation/login_screen/login/elements/build_primary_button.dart';
import 'package:the_janitorial/features/auth/presentation/login_screen/register/build_menu_button.dart';
import 'package:the_janitorial/providers/auth_provider.dart';
import 'package:the_janitorial/providers/position_provider.dart';

import 'image_picker.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

//STATE
class _RegisterFormState extends ConsumerState<RegisterForm> {
//
  var i = 0;

  late TextEditingController positionsController;
  late TextEditingController schoolsController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    positionsController = TextEditingController(text: null);
    schoolsController = TextEditingController(text: null);
  }

  @override
  void dispose() {
    positionsController.dispose();
    schoolsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//
    final authVM = ref.watch(authProvider);
    // final positionProvider = ref.watch(positionProvider);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text('Choose your profile pic\':'),
//
            const SizedBox(height: 10),
//
            const ImagePicker(),
//
            const SizedBox(height: 20),
//
            TextfieldWidget(
              placeholder: 'Enter your first and last name',
              validator: (value) {
                return null;
              },
              onSaved: (newValue) {},
            ),
//
            const SizedBox(height: 10),
//
            TextfieldWidget(
              placeholder: 'Enter your first and last name',
              validator: (value) {
                return null;
              },
              onSaved: (newValue) {},
            ),
//
            const SizedBox(height: 10),
//
            TextfieldWidget(
              placeholder: 'Enter your first and last name',
              validator: (value) {
                return null;
              },
              onSaved: (newValue) {},
            ),
//
            const SizedBox(height: 20),
//BUTTON
            BuildMenuButton(
              authVM: authVM,
              controller: positionsController,
              enumType: Positions,
              hintText: 'Choose job description',
            ),

            const SizedBox(height: 20),

            BuildMenuButton(
              authVM: authVM,
              controller: schoolsController,
              enumType: Schools,
              hintText: 'Choose your school',
            ),

            const SizedBox(height: 20),

            BuildPrimaryButton(
              authVM: authVM,
              formKey: _formKey,
              text: 'Create account',
            ),
          ],
        ),
      ),
    );
  }
}
