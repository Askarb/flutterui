import 'package:classwork/cl_jan_17/navigation/main_navigation.dart';
import 'package:classwork/cl_jan_17/ui/theme/style.dart';
import 'package:classwork/cl_jan_17/ui/widgets/primaty_button_widget.dart';
import 'package:classwork/cl_jan_17/ui/widgets/social_button_widget.dart';
import 'package:classwork/cl_jan_17/ui/widgets/text_field_widgets.dart';
import 'package:classwork/cl_jan_17/ui/widgets/titles.dart';
import 'package:classwork/cl_jan_17/utils/validator.dart';
import 'package:classwork/resources/resources.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Container(
        padding: const EdgeInsets.fromLTRB(28, 50, 13, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Title1Widget(text: 'Sign In'),
            const SizedBox(height: 40),
            const TextFieldLabel(label: 'EMAIL OR PHONE'),
            PrimaryTextField(
              hintText: 'Loremipsum@gmail.com',
              errorText: _errorText,
              onChanged: (username) {
                if (validateUsername(username)) {
                  _errorText = null;
                } else {
                  _errorText = "Enter valid phone or password";
                }
                setState(() {});
              },
            ),
            const SizedBox(height: 22),
            const TextFieldLabel(label: 'PASSWORD'),
            PasswordField(
                obscureText: _obscureText,
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }),
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
            PrimaryButton(
              onPressed: () {
                print("Login");
                Navigator.of(context).pushNamed(MainNavigationRouteNames.main);
              },
            ),
            const Center(
              child: TextFieldLabel(label: 'OR'),
            ),
            const SizedBox(height: 5),
            const SocialButton(
              text: "Continue With Google",
              iconPath: AppImages.googleIcon2,
            ),
            const SizedBox(height: 5),
            const SocialButton(
              text: "Continue With Facebook",
              iconPath: AppImages.facebookIcon,
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Text(
                  "Don’t Have an account yet?",
                  style: AppStyle.w300s15,
                ),
                Spacer(),
                YellowTextButton(
                  text: 'SIGN UP',
                  path: MainNavigationRouteNames.signup,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
