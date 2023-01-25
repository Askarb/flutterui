import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String? errorText;
  final String hintText;
  final Function(String val) onChanged;
  const PrimaryTextField(
      {super.key,
      this.errorText,
      required this.onChanged,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      maxLines: 1,
      style: const TextStyle(height: 0.9),
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xffA1A1A1),
        ),
        contentPadding: const EdgeInsets.only(bottom: -25),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xffE5E5E5),
          ),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}

class PasswordField extends StatelessWidget {
  final bool obscureText;
  final Function() onPressed;
  const PasswordField(
      {super.key, required this.obscureText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextField(
        obscureText: obscureText,
        obscuringCharacter: '•',
        decoration: InputDecoration(
          suffix: IconButton(
            onPressed: onPressed,
            icon: Icon(obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined),
          ),
          hintStyle: const TextStyle(
            color: Color(0xffA1A1A1),
            fontSize: 16,
          ),
          hintText: '*********',
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color(0xffE5E5E5),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldLabel extends StatelessWidget {
  final String label;
  const TextFieldLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
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
}
