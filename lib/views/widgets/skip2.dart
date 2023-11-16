//
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class OnboardModel {
  String img;
  String? text;

  Color bg;
  Color button;

  OnboardModel({
    required this.img,
    this.text,
    required this.bg,
    required this.button,
  });
  Color kblue = const Color(0xFF4756DF);
  Color kwhite = const Color(0xFFFFFFFF);
  Color kblack = const Color(0xFF000000);
  Color kbrown300 = const Color(0xFF8D6E63);
  Color kbrown = const Color(0xFF795548);
  Color kgrey = const Color(0xFFC0C0C0);
}

void showAlertone(BuildContext context) {
  QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Please Select Your Goal');
}
