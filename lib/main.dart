// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:user_input/pages/home.dart';
import 'package:user_input/theme/dark_mode.dart';
import 'package:user_input/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
