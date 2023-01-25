import 'package:classwork/cl_jan_17/ui/theme/style.dart';
import 'package:flutter/material.dart';

class Title1Widget extends StatelessWidget {
  final String text;
  const Title1Widget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyle.w400s48,
    );
  }
}
