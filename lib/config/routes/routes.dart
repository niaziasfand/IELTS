// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
//import 'package:ilet/view/screens/home/course.dart';
//import 'package:ilet/view/screens/home/course.dart';

import '../../view/screens/launch/splash_screen.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: AppLinks.Loading,
      page: () => SplashScreen(),
    ),
  ];
}

class AppLinks {
  static const Loading = '/Loading';
  static const openCourse = '/openCourse';
}
