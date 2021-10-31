import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/score_widget.dart';
import './widgets/body_gridview.dart';
import './widgets/bottom_buttons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(83, 147, 150, 1),
        body: BodyWidgets(),
      ),
    );
  }
}

class BodyWidgets extends StatefulWidget {
  const BodyWidgets({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyWidgets> createState() => _BodyWidgetsState();
}

class _BodyWidgetsState extends State<BodyWidgets> {
  bool oTurn = true;

  // 1st player is O
  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  void clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });
    filledBoxes = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          ScoreWidget(),
          BodyGridView(),
          BottomButtons(clearScoreBoard),
        ],
      ),
    );
  }
}
