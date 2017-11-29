import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
            children: <Widget>[
              new Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  top: 0.0,
                  child: new CustomPaint(
                    painter: new Sky(),
                  )
              ),
            ]
        )
    );
  }
}

class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // Note: coordinates start on top, so bottom must be > top.
    //       left must be < right.
    Rect rect = new Rect.fromLTRB(
        0.0, 0.0, 100.0, 200.0
    );
    Paint paint = new Paint()..color = new Color(0xFF0099FF);

    canvas.drawRect(
      rect,
      paint,
    );
  }

  @override
  bool shouldRepaint(Sky oldDelegate) {
    return false;
  }
}