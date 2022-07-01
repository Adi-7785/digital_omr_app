import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'option.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reviewTest.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int question = 100;
  int hours = 1;

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: Center(
            child: Text(
              'DigiOMR',
              style: kInfoTextStyle,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kCardColor,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              'Examination',
                              style: kBoxTextStyle,
                            ),
                            TextField(
                              controller: myController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Enter Examination Name',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              'QUESTIONS',
                              style: kBoxTextStyle,
                            ),
                            Text(
                              question.toString(),
                              style: kInfoTextStyle,
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbColor: Color(0xFF04796B),
                                inactiveTrackColor: Color(0xFF8D8E98),
                                activeTrackColor: Color(0xFFB2DFDB),
                                overlayColor: Color(0x1f009688),
                              ),
                              child: Slider(
                                value: question.toDouble(),
                                min: 10,
                                max: 300,
                                onChanged: (double newValue) {
                                  setState(() {
                                    question = newValue.round();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              'HOURS',
                              style: kBoxTextStyle,
                            ),
                            Text(
                              hours.toString(),
                              style: kInfoTextStyle,
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbColor: Color(0xFF04796B),
                                inactiveTrackColor: Color(0xFF8D8E98),
                                activeTrackColor: Color(0xFFB2DFDB),
                                overlayColor: Color(0x1f009688),
                              ),
                              child: Slider(
                                value: hours.toDouble(),
                                min: 1,
                                max: 4,
                                divisions: 3,
                                onChanged: (double newValue) {
                                  setState(() {
                                    hours = newValue.round();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Alert(
                      context: context,
                      type: AlertType.warning,
                      title: "DND",
                      desc: "Turn on Do Not Disturb Mode before test.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "COOL",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Answer(
                                    totalQues: question,
                                    totalHours: hours,
                                    testText:
                                        Text(myController.text.toUpperCase()),
                                  ),
                                ),
                                (Route<dynamic> route) => false);
                          },
                          gradient: LinearGradient(colors: [
                            Colors.teal.shade900,
                            Colors.tealAccent.shade700
                          ]),
                          width: 120,
                        )
                      ],
                    ).show();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal.shade900,
                            Colors.tealAccent.shade700
                          ],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Start Test',
                          style: kInfoTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SquareButton extends StatelessWidget {
  SquareButton({@required this.icon, @required this.enterHours});
  final IconData icon;
  final int enterHours;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {
        return _HomePageState().hours = enterHours;
      },
      elevation: 6,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
