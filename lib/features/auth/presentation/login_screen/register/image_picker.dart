import 'package:flutter/material.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
//ADD AN INKWELL TO MAKE IT CLICKABLE
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(0, 255, 255, 255),
            Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.5),
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
    );
  }
}
