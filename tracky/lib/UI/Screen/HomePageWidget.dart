import 'package:flutter/material.dart';
import 'package:tracky/UI/Screen/List/SlidableListWidget.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return MySlidableListWidget();
  }
}
