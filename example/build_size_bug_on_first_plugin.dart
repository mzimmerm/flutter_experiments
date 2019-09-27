import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart' as widgets; // note: external package imp

import 'dart:ui' as ui;

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
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _stateChanger() {
    this.setState(() { // on State

    });
  }

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = ui.window.devicePixelRatio;
    final ui.Size windowLogicalSize = ui.window.physicalSize / devicePixelRatio;
    // Let us give the Painter full width and half of height.
    final ui.Size logicalSize =
    new Size(windowLogicalSize.width, windowLogicalSize.height / 2);

    print(" ### Size: ui.window.physicalSize=${ui.window.physicalSize}, "
        "windowLogicalSize=$windowLogicalSize,"
        "logicalSize=$logicalSize");

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new Text(
              'size=$logicalSize - this prints (0,0) in first run after device connect.',
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _stateChanger,
        tooltip: 'Just force a refresh',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.    );
    );

  }
}
