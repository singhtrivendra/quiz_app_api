import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(), // Main quiz app widget
    );
  }
}
