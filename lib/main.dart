import 'package:bytebank/screens/bytebank.dart';
import 'package:flutter/material.dart';

void main() => runApp(Bytebank());

class Bytebank extends StatelessWidget {
  final _theme = ThemeData(
    primaryColor: Colors.purple[900],
    accentColor: Colors.purple[800],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.purple[900],
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.purple[900],
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
