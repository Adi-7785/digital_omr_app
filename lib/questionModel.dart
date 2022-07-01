import 'dart:ui';

import 'package:flutter/material.dart';

class QuestionModel {
  int qNo;
  String opt;
  Color testColor;

  QuestionModel({this.qNo, this.opt, this.testColor = Colors.red});
}
