import 'package:classwork/cl_jan_17/navigation/main_navigation.dart';
import 'package:classwork/cl_jan_17/ui/theme/style.dart';
import 'package:classwork/resources/resources.dart';
import 'package:flutter/material.dart';

class MyAppJan17 extends StatelessWidget {
  const MyAppJan17({super.key});

  static final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: mainNavigation.initialRoute,
      routes: mainNavigation.routes,
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.bg,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  AppImages.tiira,
                ),
                const Spacer(),
                const SizedBox(height: 100),
                Text(
                  'Rent your dream car from the ',
                  textAlign: TextAlign.center,
                  style: AppStyle.w600s26.copyWith(color: AppColor.white),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(MainNavigationRouteNames.login);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    backgroundColor: AppColor.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: const Text("Get Started"),
                ),
                const SizedBox(height: 40)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
