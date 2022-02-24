import 'package:flutter/material.dart';

class Style {
  static const basicBlue = Color(0xFF2196F3);
  static const grassGreen = Color(0xFF4CAF50);
  static const bloodRed = Color(0xFFF44336);
  static const lightGrey = Color(0xFFE0E0E0);
  static const dailyWhite = Color(0xFFFFFFFF);
  static const lightBlue = Color(0xFF03A9F4);

  static const double fontSize18 = 18;
  static const double fontSize19 = 19;
  static const double fontSize15 = 15;
  static const double fontSize16 = 16;

  static TextStyle text18(BuildContext context) {
    return const TextStyle(fontSize: 18);
  }

  static TextStyle text16(BuildContext context) {
    return const TextStyle(fontSize: 16);
  }

  static TextStyle text19(BuildContext context) {
    return const TextStyle(fontSize: 19, color: Style.dailyWhite, fontWeight: FontWeight.bold);
  }

  static TextStyle text15(BuildContext context) {
    return const TextStyle(fontSize: 15, color: Style.grassGreen, fontWeight: FontWeight.bold);
  }
}
