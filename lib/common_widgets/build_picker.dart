import 'package:flutter/cupertino.dart';

class BuildPicker extends StatefulWidget {
  const BuildPicker({
    super.key,
    required this.jobDesciptions,
    required this.onSelectedItemChanged,
    required this.scrollController,
  });
//
  final List<String> jobDesciptions;
  final Function(int)? onSelectedItemChanged;
  final FixedExtentScrollController scrollController;
  @override
  State<BuildPicker> createState() => _BuildPickerState();
}

//when inside a listview or colum, picker will only display one thing at a time,
// unless its put in a box or container
class _BuildPickerState extends State<BuildPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: CupertinoPicker(
        itemExtent: 44,
        looping: true,
        //this is to remember what the stating value is
        scrollController: widget.scrollController,
        onSelectedItemChanged: widget.onSelectedItemChanged,
        children: widget.jobDesciptions
            .map(
              (item) => Center(
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
