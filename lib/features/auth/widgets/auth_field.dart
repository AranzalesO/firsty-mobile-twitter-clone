import 'package:firsty/theme/theme.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const AuthField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Pallete.blueColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Pallete.greyColor,
            ),
          ),
          contentPadding: const EdgeInsets.all(22),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 18,
          )),
    );
  }
}
