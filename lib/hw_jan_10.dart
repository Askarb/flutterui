import 'package:classwork/resources/resources.dart';
import 'package:flutter/material.dart';

class MyAppJan10 extends StatelessWidget {
  const MyAppJan10({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HWJan10(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HWJan10(),
        '/second': (context) => const HWJan10_secondScreen(),
      },
    );
  }
}

class HWJan10 extends StatelessWidget {
  const HWJan10({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/second");
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Color(0xffA9A7A7),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 303,
              child: Image.asset(AppImages.img1),
            ),
            const Text(
              "Welcome!",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 41,
              ),
            ),
            const SizedBox(height: 22),
            const SizedBox(
              width: 262,
              child: Text(
                "There are so many things you have to experience in your life...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HWJan10_secondScreen extends StatelessWidget {
  const HWJan10_secondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Color(0xffA9A7A7),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 221,
              child: Image.asset(AppImages.img2),
            ),
            const SizedBox(height: 20),
            const Text(
              "MyDay team",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 41,
              ),
            ),
            const SizedBox(height: 52),
            const SizedBox(
              width: 262,
              child: Text(
                "prepared for you list of tasks to keep yourself busy and challenged every day, making it more fun and enjoyable",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
