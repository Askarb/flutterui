import 'package:classwork/cl_jan_17/ui/screens/car_screen.dart';
import 'package:classwork/cl_jan_17/ui/screens/login_screen.dart';
import 'package:classwork/cl_jan_17/ui/screens/main_screen.dart';
import 'package:classwork/cl_jan_17/ui/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../ui/screens/start_screen.dart';

abstract class MainNavigationRouteNames {
  static const start = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const main = '/main';
  static const detail = '/main/detail/';
}

class MainNavigation {
  // final initialRoute = MainNavigationRouteNames.detail;
  final initialRoute = MainNavigationRouteNames.start;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.start: (context) => const StartScreen(),
    MainNavigationRouteNames.login: (context) => const ClJan17(),
    MainNavigationRouteNames.signup: (context) => const SignUp(),
    MainNavigationRouteNames.main: (context) => const MainScreen(),
    MainNavigationRouteNames.detail: (context) => CarDetailWidget(),
  };
}
