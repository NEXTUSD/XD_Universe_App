import 'package:flutter/material.dart';
import 'package:xd_universe/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SetState",
      home: MyHomePage(),
    );
  }
}
