import 'package:firsty/theme/theme.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool passwordType;
  const AuthField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.passwordType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: passwordType,
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
