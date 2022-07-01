import 'package:flutter/material.dart';

class Opt extends StatelessWidget {
  final String optText;
  final String pText;
  final Function onPress;
  Opt({@required this.optText, this.pText, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        gradient: LinearGradient(
          colors: [Colors.teal.shade900, Colors.tealAccent.shade700],
          begin: FractionalOffset.centerRight,
          end: FractionalOffset.centerLeft,
        ),
      ),
      child: TextButton(
        child: Text(
          optText,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}

// class Opt extends StatefulWidget {
//   @override
//   _OptState createState() => _OptState();
// }
//

//
// class _OptState extends State<Opt> {
//   final String optText;
//   final String pText;
//
//   _OptState(this.optText, this.pText);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadiusDirectional.circular(10),
//         gradient: LinearGradient(
//           colors: [Colors.teal.shade900, Colors.tealAccent.shade700],
//           begin: FractionalOffset.centerRight,
//           end: FractionalOffset.centerLeft,
//         ),
//       ),
//       child: TextButton(
//         child: Text(
//           optText,
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.white,
//           ),
//         ),
//         onPressed: () {
//           setState(() {
//             quesNo();
//           });
//           print(pText);
//         },
//       ),
//     );
//   }
// }
