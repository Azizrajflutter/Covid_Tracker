import 'dart:async';
import 'package:covid_tracker/Views/World_States.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => Get.to(() => WorldStatesScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              child: Container(
                height: 200,
                width: 200,
                child: Image(image: AssetImage('images/virus.png')),
              ),
              builder: (context, Widget? child) {
                return Transform.rotate(
                  angle: _animationController.value * math.pi,
                  child: child,
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Covid-19\nTracker App',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
