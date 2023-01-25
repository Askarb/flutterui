import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SocialButton extends StatelessWidget {
  final String text, iconPath;
  const SocialButton({super.key, required this.text, required this.iconPath});

  @override
  Widget build(BuildContext context) {
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
