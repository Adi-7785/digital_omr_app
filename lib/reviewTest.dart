import 'package:answer_app/option.dart';
import 'package:answer_app/questionModel.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'homeScreen.dart';

class ReviewEndScreen extends StatefulWidget {
  List<QuestionModel> answerList;
  String selectedOption;
  int totQues;
  ReviewEndScreen(
      {@required this.selectedOption,
      @required this.totQues,
      @required this.answerList});
  @override
  _ReviewEndScreenState createState() => _ReviewEndScreenState();
}

class _ReviewEndScreenState extends State<ReviewEndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
      ),
      body: Container(
        child: Scrollbar(
          showTrackOnHover: true,
          child: GridView.builder(
            itemCount: widget.totQues,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade700, Colors.purple.shade500],
                    begin: FractionalOffset.centerRight,
                    end: FractionalOffset.centerLeft,
                  ),
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
            ),
          ),
        ),
      ),
    );
  }
}
