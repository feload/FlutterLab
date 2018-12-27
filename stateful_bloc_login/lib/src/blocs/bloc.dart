import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {

  // You define a property as private by adding an underscore at the beginning.
  // BehaviorSubject (from rxdart) is a special kind of StreamController that stores the last broadcasted value.
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // These getters will help make our code more readable.
  // Add data to stream.
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
    Observable.combineLatest2(email, password, (e, p) => true);

  // Change data.
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit () {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('$validEmail');
    print('$validPassword');
  }

  dispose () {
    _email.close();
    _password.close();
  }
}

// Use this line only when using global bloc paradigm.
// final bloc = Bloc();