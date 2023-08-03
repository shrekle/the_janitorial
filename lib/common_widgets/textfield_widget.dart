import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget(
      {super.key,
      this.placeholder,
      required this.validator,
      required this.onSaved,
      this.isPassword = false});
//
  final String? placeholder;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved; //can remove final

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      placeholder: widget.placeholder,
      obscureText: widget.isPassword,
      validator: widget.validator,
      onSaved: widget.onSaved,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        // color: Colors.amber,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            blurStyle: BlurStyle.normal,
          )
        ],
      ),
    );
  }
}
