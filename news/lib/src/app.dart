import 'package:flutter/material.dart';

class App extends StatefulWidget {
  State createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  Widget build (context) {
    return MaterialApp(
      home: Scaffold(
        body: Text('Body'),
      )
    );
  }
}