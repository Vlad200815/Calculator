import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.orange,
    background: Colors.black,
    primaryContainer: Color.fromARGB(255, 0, 0, 0),
    inversePrimary: Colors.green,
  ),
);
