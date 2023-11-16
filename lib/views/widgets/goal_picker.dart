import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:ihydrate_application/provider/water.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:provider/provider.dart';

ValueNotifier<int> goalNotifier = ValueNotifier<int>(0);

class GoalPicker extends StatefulWidget {
  const GoalPicker({super.key});

  @override
  State<GoalPicker> createState() => _GoalPickerState();
}

class _GoalPickerState extends State<GoalPicker> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WaterProivder>(builder: (context, waterProivder, child) {
      return Stack(children: [
        const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Edit Your Goal',
              style: TextStyle(fontSize: 21, color: Colors.purple),
            )),
        const Align(
            alignment: Alignment.centerRight,
            child: Text('ML',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ))),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 100,
            width: 200,
            child: NumberPicker(
                value: waterProivder.displayGoal(),
                minValue: 0,
                maxValue: 15000,
                step: 1000,
                onChanged: (value) {
                  // context.read<WaterProivder>().displayGoal().toString();
                  waterProivder.goalRetriever(currentValue: value);
                }),
          ),
        ),
      ]);
    });
  }
}
