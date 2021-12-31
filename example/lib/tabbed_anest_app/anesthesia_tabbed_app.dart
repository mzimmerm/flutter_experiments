import 'package:flutter/material.dart';

import './tabbed_app_more_files/FirstPage.dart';
import './tabbed_app_more_files/SecondPage.dart';
import './tabbed_app_more_files/ThirdPage.dart';

main() => runApp(const MaterialApp(
      home: AnestAppTabbedHome(),
    ));

class AnestAppTabbedHome extends StatefulWidget {
  const AnestAppTabbedHome({Key? key}) : super(key: key);
  @override
  State<AnestAppTabbedHome> createState() => _AnestAppTabbedHomeState();
}

class _AnestAppTabbedHomeState extends State<AnestAppTabbedHome> with SingleTickerProviderStateMixin {
  // Note: Controller is the state!
  // Note: The SingleTickerProviderStateMixin is related to state ability
  //       to show animations. Used in the vsync:
  // Note: So everything on the AnestAppTabbedHome is Animated,
  //       just by mixing State with SingleTickerProviderStateMixin
  TabController? controller;

  @override
  void initState() {
    controller = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Note: Scaffold here uses: appBar, body, bottomNavigationBar.
    //       The bottomNavigationBar duplicates the tab-switching function
    //       of the "TabBar inside AppBar", on path
    //       "Scaffold ->  appBar: AppBar -> bottom: -> TabBar"
    return Scaffold(
        appBar: AppBar(
          title: Title(color: Colors.green, child: const Text('Hello tabbed world')),
          bottom: TabBar(
            controller: controller,
            tabs: const <Tab>[
              Tab(icon: Icon(Icons.arrow_forward)),
              Tab(icon: Icon(Icons.arrow_downward)),
              Tab(icon: Icon(Icons.arrow_back)),
            ],
          ),
        ),
        // Note: Purpose of bottomNavigationBar is to duplicate
        //       tab navigation on top.
        //       todo : I am not sure how it is controlled without controller.
        bottomNavigationBar: Material(
            color: Colors.deepOrange,
            child: TabBar(
              controller: controller,
              tabs: const <Tab>[
                Tab(icon: Icon(Icons.arrow_forward)),
                Tab(icon: Icon(Icons.arrow_downward)),
                Tab(icon: Icon(Icons.arrow_back))
              ],
            )),
        body: TabBarView(
          controller: controller,
          children: const <Widget>[
            FirstPage(),
            SecondPage(),
            ThirdPage(),
          ],
        ));
  }
}
