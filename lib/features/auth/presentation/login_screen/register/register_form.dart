// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_janitorial/common_widgets/build_picker.dart';
import 'package:the_janitorial/common_widgets/textfield_widget.dart';
import 'package:the_janitorial/providers/auth_provider.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
//
  var i = 0;
//i can't use a getter cuz i would need access to authProvider, which i dont untill
//the build func, i assume...
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: null);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//
    final authVM = ref.watch(authProvider);
    final jobDescriptions = authVM.jobDesciptions;
    const enumList = Positions.values;

    passIndex(int index) {
      i = index;
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('Choose your profile pic\':'),
//
          const SizedBox(height: 10),
//
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(0, 255, 255, 255),
                  Theme.of(context)
                      .colorScheme
                      .onSecondaryContainer
                      .withOpacity(0.5),
                ],
                begin: Alignment.center,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer,
                )
              ],
              shape: BoxShape.circle,
            ),
            child: const Center(
                child: Text(
              '📸',
              style: TextStyle(fontSize: 30),
            )),
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
          ElevatedButton.icon(
            onPressed: () {
//
              setState(
                () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      actions: [
                        BuildPicker(
                          startingIndex: i,
                          jobDesciptions: jobDescriptions,
                          enumList: enumList,
                          passIndex: passIndex,
                        ),
                      ],
//CANCEL BUTTON
                      cancelButton: CupertinoActionSheetAction(
                        child: const Text('select'),
                        onPressed: () {
                          setState(() {
                            controller.text = enumList[i].name;
                          });
                          authVM.currentJobEnum = enumList[i];
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              );
            },
            icon: SizedBox(
              width: 200,
              height: 40,
              child: TextField(
                readOnly: true,
                enableInteractiveSelection: false,
                controller: controller,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'choose job description',
                ),
              ),
            ),
            label: const Icon(Icons.arrow_drop_down_circle_outlined),
          ),
        ],
      ),
    );
  }
}
