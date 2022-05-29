import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(LifeExpectancy());
}

class LifeExpectancy extends StatelessWidget {
  const LifeExpectancy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}
