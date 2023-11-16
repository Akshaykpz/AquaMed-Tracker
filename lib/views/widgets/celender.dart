import 'package:flutter/material.dart';
import 'package:ihydrate_application/views/widgets/notification.dart';
import 'package:intl/intl.dart';

// ignore: prefer_typing_uninitialized_variables
DateTime date = DateTime.now();

class Dateselector extends StatefulWidget {
  const Dateselector({Key? key}) : super(key: key);

  @override
  State<Dateselector> createState() => _DateselectorState();
}

class _DateselectorState extends State<Dateselector> {
  DateTime dateline = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        dateline = value!;
        date = value;
        NotificationService.selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: IconButton(
              onPressed: _showDatePicker, icon: const Icon(Icons.date_range)),
        ),
        Text(DateFormat('yyyy-MM-dd').format(dateline))
      ],
    );
  }
}
