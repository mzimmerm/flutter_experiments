import 'package:flutter/material.dart' as material
    show
        runApp,
        MaterialApp,
        StatefulWidget,
        Colors,
        Color,
        State,
        Widget,
        Scaffold,
        Stack,
        Canvas,
        Positioned,
        BuildContext,
        CustomPaint,
        CustomPainter,
        Paint;
import 'package:flutter/foundation.dart' as foundation show Key;

import 'package:flutter/widgets.dart' as widgets;

import 'package:flutter/painting.dart' as painting show TextPainter, TextSpan, TextStyle;
import 'dart:ui' as ui show Size, Rect, TextDirection, TextAlign, Offset;

void main() {
  material.runApp(const material.MaterialApp(home: HomePage()));
}

class HomePage extends material.StatefulWidget {
  const HomePage({foundation.Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends material.State<HomePage> {
  static widgets.TextPainter textPainterForLabel(String string) {
    painting.TextSpan text =
        painting.TextSpan(text: string, style: const painting.TextStyle(color: material.Colors.black, fontSize: 14.0));
    painting.TextPainter textPainter = painting.TextPainter(
        text: text,
        textDirection: ui.TextDirection.ltr, // Note: rtl, same result
        textAlign: ui.TextAlign.center, // center text in available space
        textScaleFactor: 1.0); //  textScaleFactor does nothing ??

    // layout the painter
    textPainter.layout(); // (minWidth:0.0, maxWidth:double.INFINITY) or  minWidth:100.0, maxWidth: 300.0

    return textPainter;
  }

  painting.TextPainter textPainter =
      textPainterForLabel('This text is from TextPainter. This text is from TextPainter.');

  @override
  material.Widget build(material.BuildContext context) {
    return material.Scaffold(
        body: material.Stack(children: <material.Widget>[
      material.Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          top: 0.0,
          child: material.CustomPaint(
            painter: MyCustomPainter(textPainter),
          )),
    ]));
  }
}

class MyCustomPainter extends material.CustomPainter {
  late painting.TextPainter textPainter;

  MyCustomPainter(this.textPainter);

  @override
  void paint(material.Canvas canvas, ui.Size size) {
    // Note: coordinates start on top, so bottom must be > top.
    //       left must be < right.
    ui.Rect rect = const ui.Rect.fromLTRB(0.0, 0.0, 100.0, 200.0);
    material.Paint paint = material.Paint()..color = const material.Color(0xFF0099FF);

    canvas.drawRect(
      rect,
      paint,
    );

    // note: This shows that in textPainter.paint(canvas, offset),
    //         offset is the left-top (x-y) corner of the rectangle
    //         where the text is painted
    //       Also, the result is same for ui.TextDirection.ltr / ltr
    textPainter.paint(canvas, const ui.Offset(0.0, 0.0));
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return false;
  }
}
