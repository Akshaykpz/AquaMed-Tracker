import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../boxes/box.dart';
import '../models/category/data_base.dart';

import '../views/widgets/celender.dart';
import '../views/widgets/water_page.dart';

int waterValue = 0;

class WaterProivder extends ChangeNotifier {
  // final _box = WaterGoal.getdata();
  // get _boxGet => _boxGet;

  int value = 0;

  setWaterNumberPickerValue(int value) {
    waterValue = value;
    notifyListeners();
  }

  adddata({
    required int watereditingContoller,
    required final noteditingController,
  }) {
    // Get the water goal from WaterGoal class and data from Boxes class
    final watergoal = WaterGoal.getdata();
    final box = Boxes.getdata();
    // Set a variable to keep track of the total water consumed
    double total = 0.0;
//list convert data month currect check
    for (var element in box.values.toList()) {
      try {
        if (element.date.day == date.day &&
            element.date.month == date.month &&
            element.date.year == date.year) {
          double value = double.parse(element.water.toString());
          total += value;
        }
      } catch (e) {
        log('error occurred while parsing to double: $e');
      }
    }

    double totalData = watereditingContoller.toDouble();

    if (watergoal.values.first.goal.toDouble() > total + totalData) {
      final data = WaterModel(
          date: DateTime.now(),
          water: watereditingContoller,
          subtitle: noteditingController,
          time: DateTime.now());

      box.add(data);
      data.save();
      notifyListeners();
      // Call the grap() function with the updated data and current time
      grap(Boxes.getdata(), DateTime.now());
    } else {
      log('itsdone');
    }
  }

  // goalRetriever({required final currentValue}) {
  //   Box<WaterGoal> goalBox = WaterGoal.getdata();
  //   WaterGoal myGoal = WaterGoal(goal: currentValue ?? 2000);

  //   goalBox.put(0, myGoal);
  //   myGoal.save();

  //   currentgoal.value = WaterGoal.getdata().get(0)!.goal;
  // }
  goalRetriever({required final currentValue}) {
    Box<WaterGoal> goalBox = WaterGoal.getdata();
    WaterGoal myGoal = WaterGoal(goal: currentValue ?? 2000);

    goalBox.put(0, myGoal);
    myGoal.save();
    notifyListeners();
    // Assuming currentgoal is a ValueNotifier<int>
    currentgoal.value = WaterGoal.getdata().get(0)!.goal;
    log(' this  is my value....${currentgoal.value}');
  }

  ValueNotifier<int> currentgoal = ValueNotifier(0);

  progressvalues({required final progresvalues}) {
    final data = ProgressValue.getData();
    final progressdata = ProgressValue(progressvalues: progresvalues);
    data.put(0, progressdata);
    indiacatorValue.value = data.get(0)!.progressvalues;
    indiacatorValue.notifyListeners();
    log('${data.get(0)!.progressvalues}value added');

    progressdata.save();
  }

  ValueNotifier<double> gValue = ValueNotifier(0.0);
  Future<void> grap(Box<WaterModel> box, DateTime date) async {
    double total = 0;
    final watergoal = WaterGoal.getdata();
    for (var element in box.values.toList()) {
      try {
        if (element.date.day == date.day &&
            element.date.month == date.month &&
            element.date.year == date.year) {
          double value = double.parse(element.water.toString());

          total += value;
        }
      } catch (e) {
        log('error occurred while parsing to double: $e');
      }
    }
    // final String goal = watergoal.values.first.addgoal;
    final goal = watergoal.values.isNotEmpty
        ? watergoal.values.first.goal.toDouble()
        : 0.0;
    log("total value =$total");
    log("total goal =$goal");
    double graphValue = total / goal;
    gValue.value = graphValue;
    log(total.toString());

    progressvalues(progresvalues: gValue.value);
    gValue.notifyListeners();
    log('${gValue.toString()}gvalue');
  }

  double getIndicatorValue() {
    final box = ProgressValue.getData();

    double indicatorValue = box.get(0)?.progressvalues ?? 0;

    return indicatorValue;
  }

  int displayGoal() {
    int value = WaterGoal.getdata().get(0)?.goal ?? 0;
    return value;
  }
}
