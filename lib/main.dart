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
  bool _showResult = false;

  // 1st player is O
  bool oTurn = false;

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

  void checkWinner() {
    // Checking rows
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      _showWinDialog(displayElement[3]);
    }
    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      _showWinDialog(displayElement[6]);
    }

    // Checking Column
    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      _showWinDialog(displayElement[1]);
    }
    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    }

    // Checking Diagonal
    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });

    filledBoxes = 0;
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Draw"),
            actions: [
              FlatButton(
                child: Text("Play Again"),
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" " + winner + " \" is Winner!!!"),
            actions: [
              FlatButton(
                child: Text("Play Again"),
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

  void tapped(int index) {
    setState(() {
      if (oTurn && displayElement[index] == '') {
        displayElement[index] = 'O';
        filledBoxes++;
      } else if (!oTurn && displayElement[index] == '') {
        displayElement[index] = 'X';
        filledBoxes++;
      }

      oTurn = !oTurn;
      checkWinner();
    });
  }

  Widget _showPortraitItems() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        ScoreWidget(xScore, oScore),
        BodyGridView(tapped, displayElement),
        BottomButtons(clearScoreBoard, clearBoard),
      ],
    );
  }

  Widget _showLandscapteItems() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hisobni ko'rsatish"),
            Switch(
                value: _showResult,
                onChanged: (value) {
                  setState(() {
                    _showResult = value;
                  });
                })
          ],
        ),
        _showResult
            ? ScoreWidget(xScore, oScore)
            : BodyGridView(tapped, displayElement),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          isPortrait ? _showPortraitItems() : _showLandscapteItems(),
        ],
      ),
    );
  }
}
