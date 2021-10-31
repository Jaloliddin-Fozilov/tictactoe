import 'package:flutter/material.dart';

class BottomButtons extends StatefulWidget {
  final Function clearScoreBoard;
  final Function clearBoard;

  BottomButtons(this.clearScoreBoard, this.clearBoard);

  @override
  State<BottomButtons> createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 50, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
            color: Color(0xf0037A7E),
            textColor: Colors.white,
            onPressed: () {
              widget.clearScoreBoard();
            },
            child: Text(
              "NEW GAME",
            ),
          ),
          RaisedButton(
            color: Color(0xf0037A7E),
            textColor: Colors.white,
            onPressed: () {
              widget.clearBoard();
            },
            child: Text("RESET GAME"),
          ),
        ],
      ),
    );
  }
}
