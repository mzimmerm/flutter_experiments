import 'package:flutter/material.dart';

// from https://stackoverflow.com/questions/45875334/how-to-achieve-expansion-of-a-widget-in-both-vertical-height-and-horizontal-w

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // NOT using crossAxisAlignment: CrossAxisAlignment.stretch => width = 222.0, height=0.0
    // using crossAxisAlignment: CrossAxisAlignment.stretch     => width = 222.0, height=560.0
    print("width = ${size.width}, height=${size.height}");
    canvas.drawRect(Offset.zero & size, new Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(MyCustomPainter other) => false;
}
void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Above Paint'),
            // Expanded - because we are in a Column, expand the
            //            contained row's height
            new Expanded(
              child: new Row(
                // The crossAxisAlignment is needed to give content height > 0
                //   - we are in a Row, so crossAxis is vertical, so this enforces
                //     to "stretch height".
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Text('Left of Paint'),
                  // Expanded - because we are in a Row, expand the
                  //            contained Painter's width
                  new Expanded(
                    child: new CustomPaint(
                      painter: new MyCustomPainter(),
                    ),
                  ),
                  new Text('Right of Paint'),
                ],
              ),
            ),
            new Text('Below Paint'),
          ],
        )
    ),
  ));
}
