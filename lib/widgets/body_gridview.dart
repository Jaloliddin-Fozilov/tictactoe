import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BodyGridView extends StatefulWidget {
  final Function tapped;
  final List displayElement;
  final bool isPortrait;

  BodyGridView(this.tapped, this.displayElement, this.isPortrait);

  @override
  State<BodyGridView> createState() => _BodyGridViewState();
}

class _BodyGridViewState extends State<BodyGridView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: widget.isPortrait
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  height: constraints.maxHeight,
                  margin: EdgeInsets.all(20),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            widget.tapped(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(184, 179, 148, 1),
                                  width: 3),
                            ),
                            child: Center(
                              child: Text(
                                widget.displayElement[index],
                                style: widget.displayElement[index] == "X"
                                    ? TextStyle(
                                        color: Colors.white, fontSize: 72)
                                    : TextStyle(
                                        color: Color(0xf0075557), fontSize: 72),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              },
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  margin: EdgeInsets.only(left: constraints.maxHeight / 1.4),
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            widget.tapped(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(184, 179, 148, 1),
                                  width: 3),
                            ),
                            child: Center(
                              child: Text(
                                widget.displayElement[index],
                                style: widget.displayElement[index] == "X"
                                    ? TextStyle(
                                        color: Colors.white, fontSize: 72)
                                    : TextStyle(
                                        color: Color(0xf0075557), fontSize: 72),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              },
            ),
    );
  }
}
