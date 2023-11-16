// ignore: depend_on_referenced_packages
//  import 'package:courseapplandingpage/home.dart';

import 'package:flutter/material.dart';
import 'package:ihydrate_application/provider/water.dart';
import 'package:ihydrate_application/views/pages/setting_view.dart';
import 'package:ihydrate_application/views/widgets/skip2.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/category/data_base.dart';
import '../../utils/skipone.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  // final _formKey = GlobalKey<FormState>();
  // int _currentValue = 0;
  int currentIndex = 1;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'lib/assets/images/7122331 1.png',
      text: "WELCOME TO \nWATER MINDER",
      bg: Colors.white,
      button: const Color.fromARGB(255, 38, 51, 171),
    ),
    OnboardModel(
      img: 'lib/assets/images/wallpper.png',
      bg: const Color(0xFF4756DF),
      button: const Color.fromARGB(255, 34, 79, 156),
    ),
    OnboardModel(
      img: 'lib/assets/images/17741-drinking-water.gif',
      bg: const Color.fromARGB(255, 50, 34, 165),
      button: const Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex % 1 == 0 ? kwhite : kblue,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: PageView.builder(
          itemCount: screens.length,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (_, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(screens[index].img),
                SizedBox(
                  height: 10.0,
                  child: ListView.builder(
                    itemCount: screens.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              width: currentIndex == index ? 25 : 8,
                              height: 8,
                            ),
                          ]);
                    },
                  ),
                ),
                index == 1
                    ? const Text(
                        'Stay Healthy and Refreshed\n with Our Water App 🌊',
                        style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      )
                    : const SizedBox(),
                index == 2
                    ? Column(
                        children: [
                          const Text('SET YOUR GOAL',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic)),
                          Consumer<WaterProivder>(
                              builder: (context, waterProivder, child) {
                            final int goalProvider =
                                waterProivder.displayGoal();
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                  width: 100,
                                  child: Form(
                                    child: NumberPicker(
                                        value: goalProvider,
                                        minValue: 0,
                                        maxValue: 15000,
                                        step: 1000,
                                        onChanged: (value) {
                                          waterProivder.goalRetriever(
                                              currentValue: value);
                                          // waterProivder.goalRetriever(
                                          //     currentValue: value);
                                        }),
                                  ),
                                ),
                                const Text('ML',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            );
                          }),
                        ],
                      )
                    : const SizedBox(),
                InkWell(
                  onTap: () {
                    if (index == 2) {
                      if (WaterGoal.getdata().values.isEmpty) {
                        showAlertone(context);
                      } else {
                        _storeOnboardInfo();
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyHome()));
                      }
                    }

                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    decoration: BoxDecoration(
                        color: index % 2 == 0 ? kblue : kwhite,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        index == 2
                            ? const Text('GET STARTEDED')
                            : Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: index % 2 == 0 ? kwhite : kblue),
                              ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: index % 2 == 0 ? kwhite : kblue,
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
