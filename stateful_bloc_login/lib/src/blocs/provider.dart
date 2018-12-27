import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();
  bool updateShouldNotify(_)  => true;

  Provider ({ Key key, Widget child})
    : super(key: key, child: child);

  static Bloc of(context) {
    // This line will retrieve an instance of the parente context that patches type 'Provider'
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}