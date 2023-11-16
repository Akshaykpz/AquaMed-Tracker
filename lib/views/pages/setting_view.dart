import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ihydrate_application/boxes/box.dart';
import 'package:ihydrate_application/views/pages/history_view.dart';
import 'package:ihydrate_application/views/widgets/edit_goals.dart';
import 'package:ihydrate_application/views/widgets/about.dart';
import 'package:ihydrate_application/views/widgets/Static.dart';

import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:share/share.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../models/category/data_base.dart';
import '../widgets/splash.dart';
import 'home_pageui.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // int _currentValue = 0;

  void showNumberPickerDialog(BuildContext context) {}

  Future<void> deleteAllData() async {
    Box<MedicineModel> medicineBox = MedicineModel.getData();
    Box<WaterGoal> waterGoalBox = WaterGoal.getdata();
    Box<WaterModel> categoryBox = Boxes.getdata();

    waterGoalBox.clear();
    medicineBox.clear();
    categoryBox.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (build) => const SplashReset()),
        (route) => false);
  }

  void showAlert(BuildContext context) {
    QuickAlert.show(
        context: context,
        onConfirmBtnTap: () {
          deleteAllData();
        },
        type: QuickAlertType.confirm);
  }

  int selectedpage = 0;

  final _pages = [
    const MyHomePage(),
    const MyHistory1(),
    const WaterProgressChart()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 195, 187),
        // leading: IconButton(onPressed: (() {}), icon: Icon(Icons.menu)),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
          )
        ],
        title: const Text('Water Minder'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 116,
              width: 100,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 95, 198, 184),
                  ),
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 65,
                    child: Card(
                        elevation: 4,
                        color: Colors.white54,
                        child: ListTile(
                          title: ShowGoalEdit(),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                        )),
                  ),
                  Card(
                    elevation: 4,
                    color: Colors.white54,
                    child: ListTile(
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      leading: const Icon(
                        Icons.info_outline,
                        color: Color.fromARGB(255, 121, 41, 41),
                      ),
                      title: const Text('About'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyAbout(),
                            ));
                      },
                    ),
                  ),
                  Card(
                    elevation: 4,
                    color: Colors.white54,
                    child: ListTile(
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      leading: const Icon(
                        Icons.feedback_outlined,
                        color: Color.fromARGB(255, 33, 99, 139),
                      ),
                      title: const Text('Feedback'),
                      onTap: () async {
                        const url =
                            'mailto:akshaymayyannur@gmail.com?subject=Review on Water Minder &body= Can you help me';
                        try {
                          Uri uri = Uri.parse(url);
                          await launchUrl(uri);
                          log("");
                        } catch (e) {
                          log("error");
                        }
                      },
                    ),
                  ),
                  Card(
                    elevation: 4,
                    color: Colors.white54,
                    child: ListTile(
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      leading: const Icon(
                        Icons.share,
                        color: Color.fromARGB(255, 36, 177, 62),
                      ),
                      title: const Text('Share'),
                      onTap: () async {
                        await Share.share(
                          'Check out this awesome app!',
                          subject: 'App recommendation',
                          sharePositionOrigin:
                              const Rect.fromLTWH(0, 0, 100, 100),
                        );
                      },
                    ),
                  ),
                  Card(
                    elevation: 4,
                    color: Colors.white54,
                    child: ListTile(
                      leading: const Icon(
                        Icons.lock_reset_outlined,
                        color: Color.fromARGB(255, 148, 23, 173),
                      ),
                      title: const Text('Reset'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      onTap: () {
                        // showdiloge();
                        showAlert(context);

                        // clearData();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _pages[selectedpage],
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color.fromARGB(255, 76, 197, 187),
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 300),
        height: 55,
        // buttonBackgroundColor: Colors.white,
        animationCurve: Curves.linearToEaseOut,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.history,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.pie_chart,
            size: 30,
            color: Colors.white,
          )
        ],

        onTap: (index) {
          setState(() {
            selectedpage = index;
          });
        },
      ),
    );
  }
}
