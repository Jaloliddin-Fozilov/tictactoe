import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  final Function clearScoreBoard;

  BottomButtons(this.clearScoreBoard);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 50, left: 50, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
            color: Color(0xf0037A7E),
            textColor: Colors.white,
            onPressed: () {
              clearScoreBoard;
            },
            child: Text(
              "NEW GAME",
            ),
          ),
          RaisedButton(
            color: Color(0xf0037A7E),
            textColor: Colors.white,
            onPressed: () {
              clearScoreBoard;
            },
            child: Text("RESET GAME"),
          ),
        ],
      ),
    );
  }
}
