import 'package:classwork/cl_jan_17/cl_jan_17_widget.dart';
import 'package:flutter/material.dart';

abstract class MainNavigationRouteNames {
  static const main = '/';
  static const auth = 'auth';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.main;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.main: (context) => ClJan17()
  };
}
