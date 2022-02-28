import 'package:flutter/material.dart';
import 'package:stockscanparser/utility/common/common_style.dart';
import 'package:stockscanparser/widgets/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan Parser',
      theme: ThemeData(
        scaffoldBackgroundColor: Style.draculaBlack,
        primaryColor: Style.basicBlue,
      ),
      home: const HomeScreen(
        title: 'Parser',
      ),
    );
  }
}
