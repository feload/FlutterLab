import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {

  Widget build (context) {
    // This line searches for the context of Provider patern.
    final bloc = Provider.of(context);

    return Container (
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(bottom: 10.0)),
          submitButton(bloc)
        ]
      )
    );
  }

  Widget emailField (Bloc bloc) {
    // StreamBuilder widget will wire a component to a bloc stream.
    return StreamBuilder(
      stream: bloc.email,
      // snapshot contains all data that come across the stream.
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changeEmail,
          decoration: InputDecoration (
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error
          )
        );
      },
    );
  }

  Widget passwordField (Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: 'Your password',
            labelText: 'Your password',
            errorText: snapshot.error
          ),
        );
      },
    );
  }

  Widget submitButton (Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: snapshot.hasData
          ? bloc.submit
          : null,
        );
      }
    );
  }
}