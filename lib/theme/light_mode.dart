import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.black,
    secondary: Colors.green,
    primaryContainer: Colors.grey[350],
    inversePrimary: const Color.fromARGB(255, 22, 135, 25),
  ),
);
