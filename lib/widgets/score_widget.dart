import 'package:flutter/material.dart';
import 'package:dotted_decoration/dotted_decoration.dart';

class ScoreWidget extends StatefulWidget {
  final int xScore;
  final int oScore;

  ScoreWidget(this.xScore, this.oScore);

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(top: 50),
      decoration: DottedDecoration(
        shape: Shape.line,
        linePosition: LinePosition.top,
        dash: const <int>[3, 5],
        strokeWidth: 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.xScore} : ${widget.oScore}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
