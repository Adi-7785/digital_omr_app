import 'package:answer_app/homeScreen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: kBackColor,
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              });
            },
            child: Container(
              height: 75,
              width: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade900, Colors.tealAccent.shade700],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 2),
                  builder: (BuildContext context, double _val, Widget child) {
                    return Opacity(opacity: _val, child: child);
                  },
                  child: Text(
                    "DigiOMR",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
