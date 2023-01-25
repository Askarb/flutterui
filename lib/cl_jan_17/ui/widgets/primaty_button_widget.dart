import 'package:classwork/cl_jan_17/ui/theme/style.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onPressed;
  const PrimaryButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff2B4C59),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onPressed: onPressed,
        child: const Text(
          "Log In",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}

class YellowTextButton extends StatelessWidget {
  final String text, path;
  const YellowTextButton({
    Key? key,
    required this.text,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(path);
      },
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: const TextStyle(
            color: AppColor.yellow, fontStyle: FontStyle.italic),
      ),
    );
  }
}
