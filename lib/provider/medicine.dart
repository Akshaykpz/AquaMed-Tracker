import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/category/data_base.dart';

import '../views/widgets/celender.dart';
import '../views/widgets/time.dart';

final currentTime = DateFormat('hh:mm');
final formatTime = currentTime.format(DateTime.now()).toString();

class MedcineProivder extends ChangeNotifier {
  addmed(
      {required final nameditingController,
      required final doseeditingContoleer,
      required final pillControler}) {
    final data = MedicineModel(
        dates: date,
        time: medTime ?? formatTime,
        note: nameditingController.text,
        dose: doseeditingContoleer.text,
        pill: pillControler.text);
    final box = MedicineModel.getData();
    box.add(data);
    data.save();
  }
}
