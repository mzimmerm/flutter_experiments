import 'package:flutter/material.dart';

// import 'package:path_provider/path_provider.dart'; // Allows to write to Android filesystem
// import 'package:path_provider_android/path_provider_android.dart'; // Allows to write to Android filesystem
import 'dart:io' as io show File, Directory, FileMode;
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Any time state is set, we write count to a file on Android
      writeToAndroidData('myCounterFile.txt', _counter) ;     
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Code below allows to write to Android filesystem
/// 
void writeToAndroidData(String fileName, Object data) {
  getAndroidFilepathAndAppendString(
    fileName,
    '$data\n',
  );
  print('File written out.'); // LATER-LATER: 9 - WHEN AWAIT AT
}

Future<void> getAndroidFilepathAndAppendString(
    String fileName,
    String contents,
    ) async {
  String filePath = await getFilepathFromPathProviderForFilename(fileName); // 1
  appendStringToAndroidFile(filePath, contents);  // LATER: 6
  print('filePath=$filePath written out.'); // LATER-LATER: 9 - WHEN AWAIT AT END OF FUNCTION ABOVE IS DONE
}

Future<String> getFilepathFromPathProviderForFilename(String fileName) async {
  // getExternalStorageDirectory returns Future. Await below is needed only if we want 
  //   appDocumentsDirectory to be Directory?. If we made it Future<Directory?>, no await needed.
  // But, we would have to get the Directory from the Future when Future is ready.
  io.Directory? appDocumentsDirectory = await getExternalStorageDirectory(); // 2
  String appDocumentsPath = appDocumentsDirectory!.path; // LATER: 3 - WHEN AWAIT DONE
  String filePath = '$appDocumentsPath/$fileName';  // LATER: 4

  return filePath;  // LATER: 5
}

void appendStringToAndroidFile(String filePath, String contents)  {
  // filePath here is Android full path to the fileName in the ExternalStorage dir - /user/data/0/com.flutter_charts/
  io.File file = io.File(filePath); // LATER: 7
  file.writeAsString( // LATER: 8
    contents,
    mode: io.FileMode.append,
    flush: true,
  );
}
