import 'package:flutter/material.dart';
import 'package:Bismuth/rocks%20info/CALCITE.dart';

import 'package:Bismuth/rocks%20info/GRANITE.dart';
import 'package:Bismuth/mains/Welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
