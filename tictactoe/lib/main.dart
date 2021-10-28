import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/score_widget.dart';

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

class BodyWidgets extends StatelessWidget {
  const BodyWidgets({
    Key? key,
  }) : super(key: key);

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
        ],
      ),
    );
  }
}
