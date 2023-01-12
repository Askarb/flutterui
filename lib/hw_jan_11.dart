import 'package:classwork/resources/resources.dart';
import 'package:classwork/ui/theme/onboardong_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class MainNavigationRouteNames {
  static const main = '/';
  static const second = '/second';
  static const third = '/third';
}

class MyAppJan11 extends StatelessWidget {
  const MyAppJan11({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainNavigationRouteNames.main,
      routes: {
        MainNavigationRouteNames.main: (context) => const BasePage(
              child: FirstPage(),
            ),
        MainNavigationRouteNames.second: (context) => const BasePage(
              child: SecondPage(),
            ),
        MainNavigationRouteNames.third: (context) => const BasePage(
              child: ThirdPage(),
            ),
      },
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: const [
            SizedBox(height: 70),
            Title1(text: "SIGN UP"),
            SizedBox(height: 20),
            Title3(text: "Just entry your personal details"),
            SizedBox(height: 30),
            MyTextField(hintText: 'Enter your full name'),
            SizedBox(height: 18),
            MyTextField(hintText: 'Enter your email'),
            SizedBox(height: 18),
            MyTextField(hintText: 'Enter  passowrd '),
            SizedBox(height: 18),
            MyTextField(hintText: 'Comfirm password '),
            SizedBox(height: 18),
            MainButton(
                text: 'Continue', routeName: MainNavigationRouteNames.main)
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Title1(text: "Welcome Onbord!"),
          const SizedBox(height: 10),
          const Title3(
              text: "Let’s help you meet up your best tenant or landlord"),
          const SizedBox(height: 30),
          const Title2(text: "Log in or sign up"),
          const SizedBox(height: 20),
          const MyTextField(hintText: 'Enter your phone number'),
          const SizedBox(height: 10),
          const MainButton(
              text: "Continue", routeName: MainNavigationRouteNames.third),
          const SizedBox(height: 10),
          const Title2(text: "or"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyIconButton(assetPath: AppImages.googleIcon),
              MyIconButton(assetPath: AppImages.ellipseIcon),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: Title3(
                text:
                    "By continuing, you agree to our Terms of Service Privacy Policy Content Policy"),
          )
        ],
      ),
    );
  }
}

class PrevStepIcon extends StatelessWidget {
  const PrevStepIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Navigator.canPop(context)) return const SizedBox(height: 36);
    return Container(
      alignment: Alignment.topLeft,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          width: 26,
          height: 35,
          child: Image.asset(AppImages.prevPageIcon),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String hintText;
  const MyTextField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontSize: 18),
      ),
    );
  }
}

class Title3 extends StatelessWidget {
  final String text;
  const Title3({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class MyIconButton extends StatelessWidget {
  final String assetPath;
  const MyIconButton({
    Key? key,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextButton(
            onPressed: () {},
            child: SizedBox(
              width: 56,
              height: 52,
              child: Image.asset(assetPath),
            ),
          ),
        ),
      ],
    );
  }
}

class Title2 extends StatelessWidget {
  final String text;
  const Title2({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }
}

class Title1 extends StatelessWidget {
  final String text;
  const Title1({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
      ),
    );
  }
}

class BasePage extends StatelessWidget {
  final Widget child;
  const BasePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffffffff),
        child: Column(
          children: [
            Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Positioned(
                  width: 200,
                  height: 200,
                  top: -58,
                  left: -76,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffA2F0FB).withOpacity(0.65),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    const PrevStepIcon(),
                    const SizedBox(height: 40),
                    child,
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.img3),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              color: OnboardingStyle.primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
            text: "Choose Your ",
            children: <TextSpan>[
              const TextSpan(
                text: "BEST",
                style: TextStyle(
                  color: Color(0xffD41A0E),
                ),
              ),
              const TextSpan(text: " & "),
              TextSpan(
                text: "SMART",
                style: TextStyle(
                  color: const Color(0xffD41A0ED4).withOpacity(0.83),
                ),
              ),
              const TextSpan(text: " House"),
            ],
          ),
        ),
        const IMWidget(),
        const MainButton(
            text: "Tenant", routeName: MainNavigationRouteNames.second),
        const IMWidget(),
        const MainButton(
            text: "Landlord", routeName: MainNavigationRouteNames.second),
      ],
    );
  }
}

class MainButton extends StatelessWidget {
  final String text, routeName;
  const MainButton({
    Key? key,
    required this.text,
    required this.routeName,
  }) : super(key: key);
  void nextPage(BuildContext context) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: OnboardingStyle.primaryColor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          minimumSize: const Size.fromHeight(48),
        ),
        onPressed: () {
          nextPage(context);
        },
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class IMWidget extends StatelessWidget {
  const IMWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "I am a",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
