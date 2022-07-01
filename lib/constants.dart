import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const kCardColor = Color(0xFF1D2033);
const kBackColor = Color(0xFF111328);
var kEndColor = Color(0xFFD32F2F);

const kHeadingTextStyle = TextStyle(
  fontSize: 50,
);

const kBoxTextStyle = TextStyle(
  fontSize: 30,
);
const kInfoTextStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

const kInputTopTextStyle = TextStyle(
  fontSize: 15,
  color: Color(0xFF7B7A7C),
);

const kAlertHoursStyle = AlertStyle(
  backgroundColor: kCardColor,
  overlayColor: kBackColor,
  titleStyle: TextStyle(
    color: Colors.white,
  ),
  descStyle: TextStyle(
    color: Colors.white,
  ),
);
