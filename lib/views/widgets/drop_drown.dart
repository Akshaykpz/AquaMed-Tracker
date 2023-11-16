import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final Color catcolour;
  final IconData caticon;

  const DropDown({super.key, required this.catcolour, required this.caticon});

  @override
  State<DropDown> createState() => _dropDownState();
}

// ignore: camel_case_types
class _dropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: widget.catcolour,
        ),
        Positioned.fill(
          child: Icon(
            widget.caticon,
            color: const Color.fromARGB(123, 0, 0, 0),
          ),
        ),
      ],
    );
  }
}
