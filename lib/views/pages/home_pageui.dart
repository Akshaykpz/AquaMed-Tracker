import 'package:flutter/material.dart';
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
    tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() => _tabIndex = tabController.index);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 48,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(width: 2),
            ),
            child: TabBar(
              indicatorWeight: 0,
              controller: tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
                color: colors[_tabIndex],
              ),
              labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
              unselectedLabelColor: Colors.grey,
              splashBorderRadius: BorderRadius.circular(20),
              padding: const EdgeInsets.all(3),
              tabs: const [
                Tab(text: 'WATER'),
                Tab(text: 'MEDICINE'),
              ],
            ),
          ),
          Flexible(
            child: TabBarView(
                controller: tabController,
                children: const [MyFRist(), Myseond()]),
          )
        ],
      ),
    );
  }
}
