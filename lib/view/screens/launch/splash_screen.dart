// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_styling.dart';
import 'onboarding.dart';
//import 'signup.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
  }

  void splashScreenHandler() {
    Timer(
      Duration(seconds: 3),
      () => Get.offAll(() => Onboarding()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Center(
          child: Image(
            image: AssetImage(Assets.imagesFindli),
            fit: BoxFit.contain,
            height: h(context, 241),
            width: w(context, 200),
          ),
        ),
      ),
    );
  }
}
