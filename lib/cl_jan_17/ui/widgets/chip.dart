import 'package:classwork/cl_jan_17/ui/theme/style.dart';
import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onPressed;
  const MyChip({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = isSelected ? AppColor.white : AppColor.antr;
    Color bgColor = isSelected ? AppColor.antr : AppColor.white;
    FontWeight fontWeight = isSelected ? FontWeight.w700 : FontWeight.w400;

    return ActionChip(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 3),
      label: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: fontWeight,
        ),
      ),
      side: const BorderSide(width: 1, color: AppColor.antr),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      backgroundColor: bgColor,
    );
  }
}
