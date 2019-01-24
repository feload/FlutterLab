import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _products = [];

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Título')),
        body: Column (
          children: [
            Container (
              margin: EdgeInsets.all(10.0),
              child:
            RaisedButton(
              child: Text('Add product'),
              onPressed: () {
                setState(() {
                  _products.add('food.jpg');
                });
              },
            )),
            Column (
              children: _products.map((p) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset(p),
                      Text(p)
                    ],
                  ),
                );
              }).toList()
            )
          ]
        )
      )
    );
  }
}
