import 'package:classwork/cl_jan_17/navigation/main_navigation.dart';
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

class ClJan17 extends StatefulWidget {
  const ClJan17({
    Key? key,
  }) : super(key: key);

  @override
  State<ClJan17> createState() => _ClJan17State();
}

class _ClJan17State extends State<ClJan17> {
  bool _obscureText = true;
  String? _errorText;

  Text inputLabel(String label) {
    return Text(
      label,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xff2B4C59),
      ),
    );
  }

  bool isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool isValidPhone(String value) {
    if (value.isEmpty) return false;
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    return regExp.hasMatch(value);
  }

  bool validateUsername(String username) {
    return isEmailValid(username) || isValidPhone(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Container(
        padding: const EdgeInsets.fromLTRB(28, 50, 13, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 48,
              ),
            ),
            const SizedBox(height: 40),
            inputLabel('EMAIL OR PHONE'),
            TextField(
              onChanged: (username) {
                if (validateUsername(username)) {
                  _errorText = null;
                } else {
                  _errorText = "Enter valid phone or password";
                }
                setState(() {});
              },
              maxLines: 1,
              style: TextStyle(height: 0.9),
              decoration: InputDecoration(
                errorText: _errorText,
                hintText: 'Loremipsum@gmail.com',
                hintStyle: const TextStyle(
                  color: Color(0xffA1A1A1),
                ),
                contentPadding: EdgeInsets.only(bottom: -25),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xffE5E5E5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            inputLabel('PASSWORD'),
            SizedBox(
              height: 30,
              child: TextField(
                obscureText: _obscureText,
                obscuringCharacter: '•',
                decoration: InputDecoration(
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(_obscureText == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                  ),
                  hintStyle: const TextStyle(
                    color: Color(0xffA1A1A1),
                    fontSize: 16,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xffE5E5E5),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                print("Clicked ResetButton");
              },
              child: const Text(
                "Forgot password?",
                style: TextStyle(
                  height: .6,
                  fontSize: 11,
                  color: Color(0xff000000),
                ),
              ),
            ),
            SizedBox(
              height: 52,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2B4C59),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {
                  print("Login");
                },
                child: const Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            Center(
              child: inputLabel('OR'),
            ),
            const SizedBox(height: 5),
            socialButton(
              text: "Continue With Google",
              iconPath: AppImages.googleIcon2,
            ),
            const SizedBox(height: 5),
            socialButton(
              text: "Continue With Facebook",
              iconPath: AppImages.facebookIcon,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Don’t Have an account yet?",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "SIGN UP",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Color(0xffFCC21B),
                          fontStyle: FontStyle.italic),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox socialButton({required String text, required String iconPath}) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffffffff),
            side: const BorderSide(width: 2, color: Color(0xff000000)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onPressed: () {
          print("Login");
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(31, 7, 31, 8),
          child: Row(
            children: [
              Image.asset(
                iconPath,
                height: 30,
              ),
              const Spacer(),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
