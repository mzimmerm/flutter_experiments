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

    return
    Column(
    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
    children: [
        Text('COLUMN BEGINS', style: Theme.of(context).textTheme.bodyLarge),

    Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children:
        [
         Text('ROW BEGINS', style: Theme.of(context).textTheme.bodyLarge),

    Row(
      // Only the top level Row alignment seems to matter!! Rows indented all behave as MainAxisAlignment.left.
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.ltr,
        mainAxisSize: MainAxisSize.max,
        children: [
          legendItem('11', context), // 111111111111111
          legendItem('22', context),
          // legendItem('33', context),
          Text('NEXT!', style: Theme.of(context).textTheme.bodyLarge)

        ]
    )
    ])

  ])
    ;
  }

  Widget legendItem(String id, BuildContext context) {
    //
    return
      // Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//      Expanded(
//        child:

        Row(
          // start, center, end, spaceAround, spaceBetween, spaceEvenly :: start default.
          //    space(Around, between, evenly) is like my flow
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // start, center, end, baseline, stretch :: center default.
            //         start, end, center : the same result.
            //         baseline : error.
            //         stretch : jumps to top
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.ltr,
            // min, max : max is default; min centers
            mainAxisSize: MainAxisSize.max,
            children: [
     // Expanded(
     //   child:
          Text('Hello $id! ', style: Theme.of(context).textTheme.bodyLarge)
          //  )
          ,
   // Expanded(
   // child:
          Text('Again!', style: Theme.of(context).textTheme.bodyLarge)
          //  )
    ,
            ])
//      ])
//      )
    ;
  }
}
