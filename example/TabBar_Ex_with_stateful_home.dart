import 'package:flutter/material.dart';

// See https://flutter.dev/docs/cookbook/design/tabs
void main() {
  runApp(MyTabbedApp());
}

class MyTabbedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabbedHomePage(),
      // could add title: and theme:
    );
  }
}

class MyTabbedHomePage extends StatefulWidget {

  MyTabbedHomePage({Key key, this.title}) : super(key: key);
  // It's being passed in title, you can see above.
  final String title; // => Flutter Home Demo Page

  State<MyTabbedHomePage> createState() => _MyTabbedHomePageState();

}

class _MyTabbedHomePageState extends State<MyTabbedHomePage> {

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            Text("Car"), // Icon(Icons.directions_car),
            Text("Transit"), // Icon(Icons.directions_transit),
            Text("Bike"), // Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}

