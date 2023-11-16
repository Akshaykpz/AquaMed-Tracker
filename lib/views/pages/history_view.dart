// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ihydrate_application/views/pages/history_medcine.dart';
import 'package:ihydrate_application/views/widgets/serach.dart';

import 'history_water.dart';

class MyHistory1 extends StatefulWidget {
  const MyHistory1({Key? key}) : super(key: key);

  @override
  State<MyHistory1> createState() => _MyHomePageState();
}

bool datafilter = false;
ValueNotifier<bool> filter = ValueNotifier(false);
ValueNotifier<DateTimeRange?> dateRangeNotifier = ValueNotifier(null);

const colors = [
  Color(0xFF00a9ce),
  Color(0xFF00a9ce),
  Color(0xFF00a9ce),
];

class _MyHomePageState extends State<MyHistory1> with TickerProviderStateMixin {
  void _show() async {
    dateRangeNotifier.value = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2001),
      lastDate: DateTime(2030),
      currentDate: DateTime.now(),
      saveText: 'done',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            colorScheme: const ColorScheme.light(primary: Colors.purple)
                .copyWith(secondary: Colors.purple),
          ),
          child: child!,
        );
      },
    );

    if (dateRangeNotifier.value != null) {
      // print(dateRangeNotifier.value!.start.toString());
      setState(() {});
    }
    // ignore: invalid_use_of_protected_member
    dateRangeNotifier.notifyListeners();
  }

  final _serachcontroller = TextEditingController();
  DateTimeRange selectDate =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  late TabController tabController;
  int _tabIndex = 0;
  @override
  void initState() {
    super.initState();
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
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                        onTap: () {
                          showSearch(context: context, delegate: Search());
                        },
                        controller: _serachcontroller,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        )),
                  ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  IconButton(
                      onPressed: () {
                        _show();
                      },
                      icon: const Icon(Icons.date_range)),

                  // width: 10,
                  PopupMenuButton<String>(
                      itemBuilder: (context) => <PopupMenuEntry<String>>[
                            PopupMenuItem(
                              child: const Text('Pending'),
                              onTap: () {
                                filter.value = false;
                              },
                            ),
                            PopupMenuItem(
                              onTap: () {
                                filter.value = true;
                              },
                              child: const Text('Completed'),
                            )
                          ]),
                ],
              )),
          Container(
            height: 48,
            margin: const EdgeInsets.all(10),
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
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [MyMedicine(), MyWater()],
            ),
          ),
        ],
      ),
    );
  }
}
