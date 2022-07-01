import 'package:answer_app/endTest.dart';
import 'package:answer_app/questionModel.dart';
import 'package:flutter/material.dart';
import 'package:custom_timer/custom_timer.dart';
import 'insideOpt.dart';
import 'constants.dart';
import 'reviewTest.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Answer extends StatefulWidget {
  final int totalQues;
  final int totalHours;
  final Text testText;
  Answer(
      {@required this.totalQues,
      @required this.totalHours,
      @required this.testText});
  @override
  _AnswerState createState() => _AnswerState();
}

int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

class _AnswerState extends State<Answer> {
  int queNo = 1;
  String optionSelect;
  List<QuestionModel> answerList = [];
  String quesNo() {
    if (queNo < widget.totalQues) {
      queNo++;
      String stringQuesNo = queNo.toString();
      return stringQuesNo;
    } else {
      Alert(
        context: context,
        title: "Last Ques answered.",
        desc: "You have reached the end",
        type: AlertType.warning,
        buttons: [
          DialogButton(
            child: Text(
              "Review",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            gradient: LinearGradient(
                colors: [Colors.teal.shade900, Colors.tealAccent.shade700]),
          ),
          DialogButton(
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EndTestScreen(
                    answerList: answerList,
                    selectedOption: optionSelect,
                    totQues: widget.totalQues,
                  ),
                ),
              );
              // CustomTimer(
              //   onFinishAction: CustomTimerAction.go_to_end,
              // );
            },
            gradient: LinearGradient(
                colors: [Colors.teal.shade900, Colors.tealAccent.shade700]),
          )
        ],
      ).show();
    }
  }

  @override
  void initState() {
    super.initState();
    queNo = 1;
    answerList = [];
    optionSelect = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 10,
        title: Center(child: widget.testText),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(children: [
                  InputTop(
                    data: widget.totalQues.toString(),
                    text: 'Total Ques.',
                  ),
                  InputTop(data: '$queNo', text: 'Current Ques.'),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: CustomTimer(
                            from: Duration(hours: widget.totalHours),
                            to: Duration(hours: 0),
                            onBuildAction: CustomTimerAction.auto_start,
                            builder: (CustomTimerRemainingTime remaining) {
                              return Text(
                                "${remaining.hours}:${remaining.minutes}:${remaining.seconds}",
                                style: TextStyle(fontSize: 28.0),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Time Left',
                              style: kInputTopTextStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Opt(
                    optText: 'Option A',
                    // pText: 'User Pressed A',
                    onPress: () {
                      setState(
                        () {
                          optionSelect = 'A';
                          answerList.add(
                              QuestionModel(qNo: queNo, opt: optionSelect));
                          quesNo();
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Opt(
                    optText: 'Option B',
                    onPress: () {
                      setState(() {
                        optionSelect = 'B';
                        answerList
                            .add(QuestionModel(qNo: queNo, opt: optionSelect));
                        quesNo();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Opt(
                    optText: 'Option C',
                    onPress: () {
                      setState(() {
                        optionSelect = 'C';
                        answerList
                            .add(QuestionModel(qNo: queNo, opt: optionSelect));
                        quesNo();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Opt(
                    optText: 'Option D',
                    onPress: () {
                      setState(() {
                        optionSelect = 'D';
                        answerList
                            .add(QuestionModel(qNo: queNo, opt: optionSelect));
                        quesNo();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow.shade900,
                          Colors.yellow.shade700
                        ],
                        begin: FractionalOffset.centerRight,
                        end: FractionalOffset.centerLeft,
                      ),
                    ),
                    child: TextButton(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          optionSelect = 'S';
                          answerList.add(
                              QuestionModel(qNo: queNo, opt: optionSelect));
                          quesNo();
                        });
                      },
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple.shade700,
                            Colors.purple.shade500
                          ],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft,
                        ),
                      ),
                      child: TextButton(
                        child: Text(
                          'Review',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReviewEndScreen(
                                selectedOption: optionSelect,
                                totQues: widget.totalQues,
                                answerList: answerList,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                        gradient: LinearGradient(
                          colors: [Colors.red.shade900, Colors.red.shade500],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft,
                        ),
                      ),
                      child: TextButton(
                        child: Text(
                          'End Test!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Alert(
                            context: context,
                            title: "Are you sure?",
                            desc: "This will lead to the termination of test.",
                            type: AlertType.warning,
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Go Back",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                gradient: LinearGradient(colors: [
                                  Colors.teal.shade900,
                                  Colors.tealAccent.shade700
                                ]),
                              ),
                              DialogButton(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EndTestScreen(
                                          answerList: answerList,
                                          selectedOption: optionSelect,
                                          totQues: widget.totalQues,
                                        ),
                                      ),
                                      (Route<dynamic> route) => false);
                                  // CustomTimer(
                                  //   onFinishAction: CustomTimerAction.go_to_end,
                                  // );
                                },
                                gradient: LinearGradient(colors: [
                                  Colors.teal.shade900,
                                  Colors.tealAccent.shade700
                                ]),
                              )
                            ],
                          ).show();
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputTop extends StatelessWidget {
  final String data;
  final String text;
  InputTop({@required this.data, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              data,
              style: kBoxTextStyle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: kInputTopTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
