import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ihydrate_application/views/pages/onbord_screen.dart';

class SplashReset extends StatefulWidget {
  const SplashReset({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashReset> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.purple,
          Colors.blue,
        ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SizedBox(
                width: 500,
                height: 500,
                child: Image.asset('lib/assets/images/waternewicon.png'),
              ),
            )),
      ),
    );
  }
}
