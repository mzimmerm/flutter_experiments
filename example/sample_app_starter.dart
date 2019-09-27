import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // note: external package imp


main() => runApp(MyApp());

// Stateless Widgets won't do anything to change state.
// Root of your application
class MyApp extends StatelessWidget {
  // Build method
  @override
  Widget build(BuildContext context) {
    // MaterialApp is a built in Flutter Widget that gives
    // us a lot styling out of the box.
    // The most important arguments for MaterialApp are title and home
    return new MaterialApp(
      // Arguments that Material App is looking for.
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is setting the primary color of the app to Blue.
        primarySwatch: Colors.blue,
      ),
      // MyHomePage is just another arbitrary widget
      // named by you, the developer
      home: new MyHomePage(title: 'Flutter Home Demo Page'),
    );
  }
}

// This Widget is Stateful,
// because it's managing the state of the counter.
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // It's being passed in title, you can see above.
  final String title; // => Flutter Home Demo Page

  // Stateful Widgets don't have build methods.
  // They have createState() methods.
  // Create State returns a class that extends Flutters State class.
  @override
  _MyHomePageState createState() => new _MyHomePageState();

// Stateful Widgets are rarely more complicated than this.
}

// This is the state that MyHomePage created.
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // I've left in the comments from the sample app
  // because they say it better than I could:
  void _incrementCounter() {
    // Built in Flutter Method.
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called,
    // for instance as done by the _incrementCounter method above.

    // Scaffold is another build in app that gives us a standard
    // mobile app layout. You'll most likely use this on every page
    // of your app
    return new Scaffold(
      // the bar accross the top of the app
      appBar: new AppBar(
        // State classes access properties on their
        // parent by calling widget.someProperty
        //  It's easier to think of StatefulWidgets and their corresponding
        // StateClasses as a single Widget.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child
        // and positions it in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a List of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // mainAxisAlignment and crossAxisAlignment should feel very familiar
          // if you're used to using CSS's Flexbox or Grid.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              // Text takes a String as it's first argument.
              // We're passing in the value of the counter
              // as an interpolated String.
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      // Floating action buttons are special button
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}