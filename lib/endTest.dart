import 'package:answer_app/option.dart';
import 'package:answer_app/questionModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'homeScreen.dart';

class EndTestScreen extends StatefulWidget {
  List<QuestionModel> answerList;
  String selectedOption;
  int totQues;
  EndTestScreen(
      {@required this.selectedOption,
      @required this.totQues,
      @required this.answerList});
  @override
  _EndTestScreenState createState() => _EndTestScreenState();
}

class _EndTestScreenState extends State<EndTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Answers'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              child: Scrollbar(
                showTrackOnHover: true,
                child: GridView.builder(
                  itemCount: widget.totQues,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => Ink(
                    child: InkWell(
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: index >= widget.answerList.length
                              ? Colors.red
                              : widget.answerList[index].testColor,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: index >= widget.answerList.length
                                ? [
                                    Text(
                                      'Null',
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                  ]
                                : [
                                    Text(
                                      widget.answerList[index].qNo.toString(),
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      widget.answerList[index].opt,
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          widget.answerList[index].testColor =
                              widget.answerList[index].testColor == Colors.red
                                  ? Colors.green
                                  : Colors.red;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 20,
              child: TextButton(
                child: Text(
                  'Start a New Test.',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false);
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
