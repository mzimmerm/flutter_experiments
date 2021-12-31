import 'package:flutter/material.dart';

// See https://flutter.dev/docs/cookbook/design/tabs
void main() {
  runApp(const MyTabbedApp());
}

class MyTabbedApp extends StatelessWidget {
  const MyTabbedApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyTabbedHomePage(title: 'Page Title'),
      // could add title: and theme:
    );
  }
}

class MyTabbedHomePage extends StatefulWidget {
  const MyTabbedHomePage({Key? key, required this.title}) : super(key: key);
  // It's being passed in title, you can see above.
  final String title; // => Flutter Home Demo Page

  @override
  State<MyTabbedHomePage> createState() => _MyTabbedHomePageState();
}

class _MyTabbedHomePageState extends State<MyTabbedHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        body: const TabBarView(
          children: [
            Text('Car'), // Icon(Icons.directions_car),
            Text('Transit'), // Icon(Icons.directions_transit),
            Text('Bike'), // Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
