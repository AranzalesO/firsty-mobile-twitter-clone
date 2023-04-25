import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

String getNameFromEmail(String email) {
  // juanjoaranzales@gmail.com
  // List = [juanjoaranzales, @gmail.com]
  return email.split('@')[0];
}
