import 'package:answer_app/homeScreen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'intro.dart';

void main() => runApp(DigiOMR());

class DigiOMR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackColor,
      ),
      home: IntroPage(),
    );
  }
}
