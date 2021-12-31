import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.thumb_up,
        size: 150.0,
        color: Colors.brown,
      ),
    );
  }
}
