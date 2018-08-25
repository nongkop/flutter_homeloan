import 'package:flutter/material.dart';
import './pages/formpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'calulateMoney',
        theme: new ThemeData(
          primaryColor: Colors.blueGrey[700],
          backgroundColor: Colors.teal[100],
        ),
        home : FormPage(),
    );
  }
}
