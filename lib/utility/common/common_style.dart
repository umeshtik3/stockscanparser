import 'package:flutter/material.dart';

class Style {
  static const basicBlue = Color(0xFF2196F3);
  static const grassGreen = Color(0xFF4CAF50);
  static const bloodRed = Color(0xFFF44336);
  static const lightGrey = Color(0xFFE0E0E0);
  static const dailyWhite = Color(0xFFFFFFFF);
  static const lightBlue = Color(0xFF03A9F4);
  static const draculaBlack = Color(0xFF000000);

  static const double fontSize18 = 18;
  static const double fontSize19 = 19;
  static const double fontSize15 = 15;
  static const double fontSize16 = 16;
  static const double padding8 = 8;
  static const double padding10 = 10;
  static const double padding18 = 18;
  static const double height80 = 80;
  static const double width200 = 200;

  static TextStyle text18(BuildContext context) {
    return const TextStyle(fontSize: 18);
  }

  static TextStyle text20(BuildContext context) {
    return const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);
  }

  static TextStyle text19(BuildContext context) {
    return const TextStyle(fontSize: 19, color: Style.dailyWhite, fontWeight: FontWeight.bold);
  }

  static TextStyle text15(BuildContext context) {
    return const TextStyle(fontSize: 15, color: Style.grassGreen, fontWeight: FontWeight.bold);
  }

  static Color indexColor(String color) {
    return color == 'green' ? Style.grassGreen : Style.bloodRed;
  }
}
