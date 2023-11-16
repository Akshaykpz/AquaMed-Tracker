import 'package:flutter/material.dart';
import 'package:ihydrate_application/provider/water.dart';
import 'package:quickalert/quickalert.dart';

import '../../boxes/box.dart';
import '../../models/category/data_base.dart';

void showAlert(BuildContext context) {
  QuickAlert.show(
      context: context, onConfirmBtnTap: () {}, type: QuickAlertType.confirm);
}

Future<void> delete(WaterModel waterModel) async {
  await waterModel.delete();
  ProgressValue.getData();
  WaterProivder().grap(Boxes.getdata(), DateTime.now());
}

showAlertmed(BuildContext context, index, data) {
  QuickAlert.show(
      context: context,
      onConfirmBtnTap: () {
        deletemedcine(data[index]);
      },
      type: QuickAlertType.confirm);
}

Future<void> deletemedcine(MedicineModel medicineModel) async {
  await medicineModel.delete();
}

Future<void> deletem(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Dialog Title'),
        content: const Text('Dialog content goes here.'),
        actions: [
          TextButton(
            onPressed: () {
              // Do something when the user presses this button
              Navigator.of(context).pop();
            },
            child: const Text('Button'),
          ),
        ],
      );
    },
  );
}
