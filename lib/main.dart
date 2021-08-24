import 'package:bytebank/screens/bytebank.dart';
import 'package:flutter/material.dart';

void main() => runApp(Bytebank());

class Bytebank extends StatelessWidget {

  final _theme = ThemeData(
    primaryColor: Colors.green[900],
    accentColor: Colors.greenAccent[700],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.green[900],
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.green[900],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme,
      home: Dashboard(),
    );
  }
}

