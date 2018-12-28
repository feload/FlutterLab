import 'package:flutter/material.dart';
import 'screens/home.dart';

class App extends StatelessWidget {
  Widget build (context) {
    return MaterialApp(
      title: 'This is a title.',
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}