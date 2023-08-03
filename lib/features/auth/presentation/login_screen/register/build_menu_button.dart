import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_janitorial/providers/auth_provider.dart';

import '../../../../../common_widgets/build_picker.dart';

// ignore: must_be_immutable
class BuildMenuButton extends StatefulWidget {
  BuildMenuButton({
    super.key,
    required this.authVM,
    required this.controller,
    required this.enumType,
    required this.hintText,
    this.i = 0,
  });

  final Type enumType;
  final String hintText;
  TextEditingController controller;
  int i;
  final Auth authVM; //this needs to be set to recieve a Provider not Auth

  @override
  State<BuildMenuButton> createState() => _BuildMenuButtonState();
}

//STATE
class _BuildMenuButtonState extends State<BuildMenuButton> {
//
  passIndex(int index) {
    widget.i = index;
  }

  List<String> get enumItems {
    if (widget.enumType == Positions) {
      final itemsList = Positions.values.map((e) => e.name).toList();
      return itemsList;
    }
    if (widget.enumType == Schools) {
      final itemsList = Schools.values.map((e) => e.name).toList();
      return itemsList;
    }
    return ['🥵 Some done screwed up, enumItems(), builMenuButton'];
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        //
        setState(
          () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                actions: [
                  BuildPicker(
                    startingIndex: widget.i,
                    enumList: enumItems,
                    passIndex: passIndex,
                  ),
                ],
                //CANCEL BUTTON
                cancelButton: CupertinoActionSheetAction(
                  child: const Text('select'),
                  onPressed: () {
                    setState(() {
                      widget.controller.text = enumItems[widget.i];
                    });
                    widget.authVM.loadEnumItem(enumItems[widget.i]);

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
          controller: widget.controller,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.top,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
          ),
        ),
      ),
      label: const Icon(Icons.arrow_drop_down_circle_outlined),
    );
  }
}
