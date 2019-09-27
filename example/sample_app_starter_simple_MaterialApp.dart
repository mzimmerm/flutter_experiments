import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // note: external package imp

// Put stateful MaterialApp on top. Stateful ==> no build, build is in state,
//   here unused.
// DO NOT USE THIS SIMPLE METHOD, BECAUSE HOT RELOAD DOES NOT WORK WITH IT
main() {
  runApp(MaterialApp(
    // title: 'Test App',
    // theme: ThemeData(primarySwatch: Colors.green),
    home: new MyHomePage(),
  ));
}
// Stateful home page - generally home page will be stateful
class MyHomePage extends StatefulWidget {

  // Stateful Widget: no build(), has _MyHomePageState createState().
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

// This is the state that MyHomePage returned in createState()
class _MyHomePageState extends State<MyHomePage> {

  // todo state field and stateSetterSS() method

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Text on AppBar"), // todo: was: widget.title
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center, // center along Y
          crossAxisAlignment: CrossAxisAlignment.start, // start (left) along X
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text("Counter was here"),
          ],
        ),
      ),
    );
  }
}