import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.thumb_up,
        size: 150.0,
        color: Colors.teal,
      ),
    );
  }
}
