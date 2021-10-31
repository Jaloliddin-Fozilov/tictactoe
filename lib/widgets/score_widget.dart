import 'package:flutter/material.dart';
import 'package:dotted_decoration/dotted_decoration.dart';


class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    Key? key,
  }) : super(key: key);

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
            "0 : 0",
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
