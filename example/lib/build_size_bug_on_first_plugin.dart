import 'package:flutter/material.dart';

import 'dart:ui' as ui;

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Title',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _stateChanger() {
    setState(() {
      // on State
    });
  }

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = ui.window.devicePixelRatio;
    final ui.Size windowLogicalSize = ui.window.physicalSize / devicePixelRatio;
    // Let us give the Painter full width and half of height.
    final ui.Size logicalSize = Size(windowLogicalSize.width, windowLogicalSize.height / 2);

    // print(" ### Size: ui.window.physicalSize=${ui.window.physicalSize}, "
    //     "windowLogicalSize=$windowLogicalSize,"
    //     "logicalSize=$logicalSize");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'size=$logicalSize - this prints (0,0) in first run after device connect.',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _stateChanger,
        tooltip: 'Just force a refresh',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.    );
    );
  }
}
