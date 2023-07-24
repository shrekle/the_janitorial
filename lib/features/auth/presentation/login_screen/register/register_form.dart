import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_janitorial/common_widgets/build_picker.dart';
import 'package:the_janitorial/common_widgets/textfield_widget.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
//
  final jobDesciptions = ['staff', 'janitor', 'sub'];
  var index = 0;
  var showPicker = false;
  //this need to be set up that way because it cant initialize otherwise
  late FixedExtentScrollController scrollController;

  //try this one too
  FixedExtentScrollController get scrollGetter {
    return FixedExtentScrollController(initialItem: index);
  }

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(initialItem: index);
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollGetter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          const Text('Choose your job description:'),
//
          const SizedBox(height: 10),
//
          ElevatedButton.icon(
            onPressed: () {
              setState(
                () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      cancelButton: CupertinoActionSheetAction(
                        child: const Text('select'),
                        onPressed: () {
                          showPicker = false;
                          Navigator.pop(context);
                        },
                      ),
                      actions: [
                        BuildPicker(
                          //this is to remember what the stating value is
                          scrollController: scrollGetter,
                          jobDesciptions: jobDesciptions,
                          onSelectedItemChanged: (index) {
                            setState(() {
                              this.index = index;
                              // showPicker = false;
                            });
                          },
                        )
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.wheelchair_pickup_sharp),
            label: Text(jobDesciptions[index]),
          ),
        ],
      ),
    );
  }
}
