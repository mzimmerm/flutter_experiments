
// note: all classes without prefix in this code are from material.
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as widgets; // note: external package imp

import 'dart:ui' as ui;
import 'dart:math' as math;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo Title',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Chart Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class LineChartPainter extends CustomPainter {

  Color _circleColor;

  LineChartPainter({
    widgets.BuildContext context,
    Color                chartData,}) // options differ
  {
    _circleColor = chartData;
  }

  /// abstract in super.
  bool shouldRepaint(widgets.CustomPainter oldDelegate) {
    return true;
  }

  /// Paint the biggest circle that fits to [size]
  void paint(ui.Canvas canvas, ui.Size size) {

     print(" ### Size: paint(): passed size = ${size}");

     var radius = [size.height, size.width].reduce(math.min) / 2;
     ui.Offset middle = size.center(Offset.zero); //new ui.Offset(dx, dy)
     ui.Paint paint = new ui.Paint();
     paint.style = ui.PaintingStyle.fill;
     paint.color = _circleColor;

     canvas.drawCircle(middle, radius, paint);
   }
}

class LineChart extends widgets.CustomPaint {

  // Default CustomPaint constructor
  /// Default constructor accepts size
  LineChart({
    widgets.Key           key,
    widgets.CustomPainter painter,
    widgets.CustomPainter foregroundPainter,
    widgets.Size size:    widgets.Size.zero,
    widgets.Widget         child
  }) : super(
      key:                  key,
      painter:              painter,
      foregroundPainter:    foregroundPainter,
      size:                 size,
      child:                child
  );
}

class _MyHomePageState extends State<MyHomePage> {

  Color _circleColor = Colors.yellow;

  void _chartStateChanger() {
    this.setState(() { // on State

       int colorHex = new math.Random().nextInt(0xFFFFFFFF);
      _circleColor = new ui.Color(colorHex); // todo why does new Color()also work
    });
  }

  @override
  Widget build(BuildContext context) {


    final double devicePixelRatio = ui.window.devicePixelRatio;
    final ui.Size windowLogicalSize = ui.window.physicalSize / devicePixelRatio;
    // Let us give the LineChart full width and half of height.
    final ui.Size chartLogicalSize =
      new Size(windowLogicalSize.width, windowLogicalSize.height / 2);

    print(" ### Size: ui.window.physicalSize=${ui.window.physicalSize}, "
          "windowLogicalSize=$windowLogicalSize,"
          "chartLogicalSize=$chartLogicalSize");

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new Text(
              'vvvvvvvv:',
            ),
            new RaisedButton(
              color: Colors.green,
              onPressed: _chartStateChanger,
            ),
            new Text(
              'vvvvvvvv:',
            ),

            new Row(
              children: [
                new Text('>>>'),

                new LineChart(
                  size: chartLogicalSize,
                  painter: new LineChartPainter(
                    context: context,
                    chartData: _circleColor,
                  ),
                ),

                new Text('<<<'),
              ],

            ), // row

            new Text('^^^^^^:'),
            new RaisedButton(
              color: Colors.green,
              onPressed: _chartStateChanger,
            ),

          ],
        ),
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: _chartStateChanger,
        tooltip: 'Set Chart Data',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
