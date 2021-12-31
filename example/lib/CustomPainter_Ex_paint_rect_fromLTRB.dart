import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          top: 0.0,
          child: CustomPaint(
            painter: MyCustomPainter(),
          )),
    ]));
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Note: coordinates start on top, so bottom must be > top.
    //       left must be < right.
    Rect rect = const Rect.fromLTRB(0.0, 0.0, 100.0, 200.0);
    Paint paint = Paint()..color = const Color(0xFF0099FF);

    canvas.drawRect(
      rect,
      paint,
    );
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return false;
  }
}
