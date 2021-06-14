// THIS DOES NOT WORK AS INTENDED

import 'package:flutter/material.dart' as material
    show
        runApp,
        MaterialApp,
        StatefulWidget,
        HomePage,
        Colors,
        Color,
        State,
        HomePageState,
        Widget,
        Scaffold,
        Stack,
        Canvas,
        Positioned,
        BuildContext,
        CustomPaint,
        CustomPainter,
        Paint;

import 'package:flutter/widgets.dart' as widgets;

import 'package:flutter/painting.dart' as painting
    show TextPainter, TextSpan, TextStyle;
import 'dart:ui' as ui show Size, Rect, TextDirection, TextAlign, Offset, Color;

void main() {
  material.runApp(new material.MaterialApp(home: new HomePage()));
}

class HomePage extends material.StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends material.State<HomePage> {

  /*
  static widgets.TextPainter textPainterForLabel(String string) {

    painting.TextSpan text = new painting.TextSpan(
      text: string,
      style:
          new painting.TextStyle(color: material.Colors.black, fontSize: 14.0),
    );

    painting.TextPainter textPainter = new painting.TextPainter(
      text: text,
      textDirection: ui.TextDirection.ltr, // Note: rtl, same result
      textAlign: ui.TextAlign.center, // center text in available space
      textScaleFactor: 1.0,
    ); //  textScaleFactor does nothing ??

    // layout the painter
    textPainter
        .layout(); // (minWidth:0.0, maxWidth:double.INFINITY) or  minWidth:100.0, maxWidth: 300.0

    return textPainter;
  }
  */

  // todo -10: painting.TextPainter textPainter = textPainterForLabel("Some Text");
//  material.CustomPaint myCustomPaintTextForLabel = new material.CustomPaint(

  MyTextCustomPaint myTextCustomPaintForLabel = new MyTextCustomPaint(
  painter: new MyTextCustomPainter(), // new Sky()
  child: new widgets.Center(
    child: new widgets.Text(
      'Once upon a time...',
      style: const painting.TextStyle(
        fontSize: 40.0,
        color: const ui.Color(0xFFFFFFFF),
      ),
    ),
  ),
);

  @override
  material.Widget build(material.BuildContext context) {
    return new material.Scaffold(
        body: new material.Stack(children: <material.Widget>[
      new material.Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          top: 0.0,
          /* todo -10
          child: new material.CustomPaint(
            painter: new SkyCustomPainter(textPainter),
          )),
          */
          child: new widgets.CustomPaint(
            painter: new MyCustomPainterSky(myTextCustomPaintForLabel),
          ),
      )
        ]));
  }
}

class SkyCustomPainter extends material.CustomPainter {
  painting.TextPainter textPainter;

  SkyCustomPainter(painting.TextPainter textPainter) {
    this.textPainter = textPainter;
  }

  @override
  void paint(material.Canvas canvas, ui.Size size) {
    // Note: coordinates start on top, so bottom must be > top.
    //       left must be < right.
    ui.Rect rect = new ui.Rect.fromLTRB(0.0, 0.0, 100.0, 200.0);
    material.Paint paint = new material.Paint()
      ..color = new material.Color(0xFF0099FF);

    canvas.drawRect(
      rect,
      paint,
    );

    // note: This shows that in textPainter.paint(canvas, offset),
    //         offset is the left-top (x-y) corner of the rectangle
    //         where the text is painted
    //       Also, the result is same for ui.TextDirection.ltr / ltr
    textPainter.paint(canvas, new ui.Offset(100.0, 100.0));
  }

  @override
  bool shouldRepaint(SkyCustomPainter oldDelegate) {
    return false;
  }
}

class MyCustomPainterSky extends material.CustomPainter {
  MyTextCustomPaint myTextCustomPaint;

  MyCustomPainterSky(MyTextCustomPaint textPaint) {
    this.myTextCustomPaint = textPaint;
  }

  @override
  void paint(material.Canvas canvas, ui.Size size) {
    // Note: coordinates start on top, so bottom must be > top.
    //       left must be < right.
    ui.Rect rect = new ui.Rect.fromLTRB(0.0, 0.0, 100.0, 200.0);
    material.Paint paint = new material.Paint()
      ..color = new material.Color(0xFF0099FF);

    canvas.drawRect(
      rect,
      paint,
    );

    // note: This shows that in textPainter.paint(canvas, offset),
    //         offset is the left-top (x-y) corner of the rectangle
    //         where the text is painted
    //       Also, the result is same for ui.TextDirection.ltr / ltr
    // todo -10: Real TextPainter accepts Offset: textPainter.paint(canvas, new ui.Offset(100.0, 100.0));
    myTextCustomPaint.painter.paint(canvas, new ui.Size(100.0, 100.0));
  }

  @override
  bool shouldRepaint(SkyCustomPainter oldDelegate) {
    return false;
  }
}
class MyTextCustomPainter extends material.CustomPainter {

  @override
  void paint(material.Canvas canvas, ui.Size size) {
    /* todo -10
    // Note: coordinates start on top, so bottom must be > top.
    //       left must be < right.
    ui.Rect rect = new ui.Rect.fromLTRB(0.0, 0.0, 100.0, 200.0);
    material.Paint paint = new material.Paint()
      ..color = new material.Color(0xFF0099FF);

    canvas.drawRect(
      rect,
      paint,
    );

    // note: This shows that in textPainter.paint(canvas, offset),
    //         offset is the left-top (x-y) corner of the rectangle
    //         where the text is painted
    //       Also, the result is same for ui.TextDirection.ltr / ltr
    textPainter.paint(canvas, new ui.Offset(100.0, 100.0));
    */
  }

  bool shouldRepaint(MyTextCustomPainter oldPainter) {
    return true;
  }
}

class MyTextCustomPaint extends material.CustomPaint { // widget

  MyTextCustomPaint({MyTextCustomPainter painter, material.Widget child})
      : super (painter: painter, child: child);
}
