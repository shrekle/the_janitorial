import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      // margin: const EdgeInsets.only(
      //   top: 30,
      //   bottom: 20,
      //   left: 20,
      //   right: 20,
      // ),
      width: 300,
      child: Text(
        '🪠💩 🚽',
        style: TextStyle(fontSize: 80),
      ),
    );
  }
}
