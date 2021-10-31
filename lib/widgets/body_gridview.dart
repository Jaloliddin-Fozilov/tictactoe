import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BodyGridView extends StatefulWidget {
  final Function tapped;
  final List displayElement;

  BodyGridView(this.tapped, this.displayElement);

  @override
  State<BodyGridView> createState() => _BodyGridViewState();
}

class _BodyGridViewState extends State<BodyGridView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
       flex: 3,
      child: Container(
        margin: EdgeInsets.all(20),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
            itemCount: 9,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  widget.tapped(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(184, 179, 148, 1), width: 3),
                  ),
                  child: Center(
                    child: Text(
                      widget.displayElement[index],
                      style: widget.displayElement[index] == "X" ? TextStyle(color: Colors.white, fontSize: 72) : TextStyle(color: Color(0xf0075557), fontSize: 72),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
