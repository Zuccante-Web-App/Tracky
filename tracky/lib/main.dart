import 'package:flutter/material.dart';
import 'package:tracky/UI/Screen/HomePageWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracky',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.light, primaryColor: Colors.amber),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.amber),
      home: HomePageWidget(),
    );
  }
}

