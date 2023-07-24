import 'package:flutter/material.dart';

class ScrollWheel extends StatefulWidget {
  const ScrollWheel({super.key});

  @override
  State<ScrollWheel> createState() => _ScrollWheelState();
}

class _ScrollWheelState extends State<ScrollWheel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWheelScrollView(
        itemExtent: 50,
        perspective: 0.005,
        children: [
          Container(color: Colors.blueGrey, child: const Center(child: Text('1'))),
          Container(color: Colors.blueGrey, child: const Center(child: Text('1'))),
          Container(color: Colors.blueGrey, child: const Center(child: Text('1'))),
          Container(color: Colors.blueGrey, child: const Center(child: Text('1'))),
        ],
      ),
    );
  }
}
