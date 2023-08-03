// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildPicker extends StatefulWidget {
  const BuildPicker({
    super.key,
    required this.passIndex,
    required this.startingIndex,
    this.enumList,
  });
//
  final int startingIndex;
  final Function(int) passIndex;
  final List<String>? enumList;

  @override
  State<BuildPicker> createState() => _BuildPickerState();
}

//when inside a listview or colum, picker will only display one thing at a time,
// unless its put in a box or container
class _BuildPickerState extends State<BuildPicker> {
//
  FixedExtentScrollController get scrollController {
    return FixedExtentScrollController(initialItem: widget.startingIndex);
  }

  late FixedExtentScrollController scrollController2;

  @override
  void initState() {
    scrollController2 =
        FixedExtentScrollController(initialItem: widget.startingIndex);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//
    final primaryColor = Theme.of(context).colorScheme.primary;
    var i = widget.startingIndex;

    return SizedBox(
      height: 140,
      child: StatefulBuilder(
        builder: (context, setState) => CupertinoPicker(
          itemExtent: 40,
          scrollController: scrollController,
          onSelectedItemChanged: (index) {
            setState(
              () {
                widget.passIndex(index);
                i = index;
                // widget.auth.jobDescriptionIndex = index;
              },
            );
          },
          selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
            background: primaryColor.withOpacity(0.1),
          ),
          children: List.generate(
            widget.enumList!.length,
            (index) {
              final isSelected = i == index;
              final item = widget.enumList![index];
              final color = isSelected ? primaryColor : Colors.black54;
              return Center(
                child: Text(
                  item,
                  style: TextStyle(
                    color: color,
                    fontSize: 24,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
