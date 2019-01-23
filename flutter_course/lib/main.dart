import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Título')),
            body: Column(children: [
              Container (
                margin: EdgeInsets.all(10.0),
                child:
              RaisedButton(
                child: Text('Add product'),
                onPressed: () {

                },
              )),
              Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('food.jpg'),
                    Text('Food paradise')
                  ],
                ),
              ),
            ])));
  }
}
