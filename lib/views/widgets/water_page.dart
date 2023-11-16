import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:ihydrate_application/boxes/box.dart';
import 'package:ihydrate_application/models/category/data_base.dart';
import 'package:ihydrate_application/provider/water.dart';
import 'package:ihydrate_application/views/pages/add_water.dart';
import 'package:ihydrate_application/views/widgets/water_list.dart';
import 'package:ihydrate_application/views/widgets/goal_picker.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

ValueNotifier<double> indiacatorValue = ValueNotifier<double>(0);

class MyFRist extends StatefulWidget {
  const MyFRist({super.key});

  @override
  State<MyFRist> createState() => _MyFRistState();
}

class _MyFRistState extends State<MyFRist> {
  DateTime scheduleTime = DateTime.now();
  @override
  @override
  void initState() {
    final gg = WaterGoal.getdata();
    WaterProivder().currentgoal.value = gg.values.first.goal;
    WidgetsFlutterBinding.ensureInitialized();
    WaterProivder().grap(Boxes.getdata(), DateTime.now());
    Boxes.getdata();
    WaterGoal.getdata();
    ProgressValue.getData();

    context.read<WaterProivder>().currentgoal.value;

    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    goalNotifier.notifyListeners();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 250, 250),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            // ignore: deprecated_member_use
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 12),
              // ignore: deprecated_member_use
              child: TyperAnimatedTextKit(
                text: const [
                  'Water is the Best Natural Remedy.Drink Your Better Health'
                ],
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
                speed: const Duration(milliseconds: 130),
              ),
            ),

            Consumer<WaterProivder>(
              builder: (context, value, child) {
                return (value.getIndicatorValue() > 0.99)
                    ? Image.asset(
                        'lib/assets/images/output-onlinegiftools (2).gif')
                    : CircularPercentIndicator(
                        radius: 120,
                        animation: true,
                        animationDuration: 1000,
                        lineWidth: 20,
                        percent:
                            context.read<WaterProivder>().getIndicatorValue(),
                        progressColor: const Color.fromARGB(255, 74, 185, 213),
                        backgroundColor:
                            const Color.fromARGB(255, 167, 153, 153),
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'YOUR GOAL ',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              context
                                  .read<WaterProivder>()
                                  .displayGoal()
                                  .toString(), // Use context.read instead
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      );
              },
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Today Records',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const WaterList(),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const AddWaterData())));
        },
        backgroundColor: const Color.fromARGB(255, 56, 176, 166),
        // label: const Text('Add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
