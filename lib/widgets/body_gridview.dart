import 'package:flutter/material.dart';

class BodyGridView extends StatelessWidget {
  const BodyGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Text("data");
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(184, 179, 148, 1), width: 2),
                ),
                child: Center(
                  child: Text(
                    "XOOOOOX: "[index],
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
