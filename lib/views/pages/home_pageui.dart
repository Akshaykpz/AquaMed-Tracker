import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:ihydrate_application/boxes/box.dart';
import 'package:ihydrate_application/provider/water.dart';
import 'package:ihydrate_application/views/widgets/medcine_page.dart';
import 'package:ihydrate_application/views/widgets/water_page.dart';

import '../../models/category/data_base.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const colors = [
  Color(0xFF00a9ce),
  Color(0xFF00a9ce),
];

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tabController;
  int _tabIndex = 0;
  @override
  void initState() {
    super.initState();
    WaterProivder().grap(Boxes.getdata(), DateTime.now());
    WaterGoal.getdata();
    tabController = TabController(
      length: 2,
      vsync: this,
    )..addListener(() {
        setState(
          () => _tabIndex = tabController.index,
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter alarm clock example'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Create alarm at 23:59',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  FlutterAlarmClock.createAlarm(hour: 23, minutes: 59);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: const TextButton(
                onPressed: FlutterAlarmClock.showAlarms,
                child: Text(
                  'Show alarms',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Create timer for 42 seconds',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  FlutterAlarmClock.createTimer(length: 42);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: const TextButton(
                onPressed: FlutterAlarmClock.showTimers,
                child: Text(
                  'Show Timers',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Container(
    //         height: 48,
    //         margin: const EdgeInsets.all(12),
    //         decoration: BoxDecoration(
    //           borderRadius: const BorderRadius.all(Radius.circular(20)),
    //           border: Border.all(width: 1),
    //         ),
    //         child: TabBar(
    //           controller: tabController,
    //           indicator: BoxDecoration(
    //             borderRadius: BorderRadius.circular(
    //               16.0,
    //             ),
    //             color: colors[_tabIndex],
    //           ),
    //           labelStyle: const TextStyle(
    //               color: Colors.white,
    //               fontSize: 13,
    //               fontWeight: FontWeight.w600),
    //           unselectedLabelColor: Colors.grey,
    //           splashBorderRadius: BorderRadius.circular(10),
    //           padding: const EdgeInsets.all(3),
    //           tabs: const [
    //             Tab(
    //               text: 'WATER',
    //             ),
    //             Tab(text: 'MEDICINE'),
    //           ],
    //         ),
    //       ),
    //       Flexible(
    //         child: TabBarView(
    //             controller: tabController,
    //             children: const [MyFRist(), Myseond()]),
    //       )
    //     ],
    //   ),
    // );
  }
}
