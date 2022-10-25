import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

@immutable
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // start, center, end, spaceAround, spaceBetween, spaceEvenly: start default.
      //    space(Around, between, evenly) is like my flow
        mainAxisAlignment: MainAxisAlignment.end,
        // start, center, end, baseline, stretch : seems irrelevant
        crossAxisAlignment: CrossAxisAlignment.end,
        textDirection: TextDirection.ltr,
        // min, max : max is default; min centers
        mainAxisSize: MainAxisSize.max,
        children: [
          legendItem('111111111111111', context),
          legendItem('22', context),
          legendItem('33', context),
        ]);
  }

  Widget legendItem(String id, BuildContext context) {
    //
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        textDirection: TextDirection.ltr,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Hello $id! ',
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge,
          ),
          Text(
            'Again!',
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge,
          ),
        ]);
  }
}
