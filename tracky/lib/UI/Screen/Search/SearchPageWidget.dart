import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:tracky/UI/Screen/HomePageWidget.dart';
import 'package:tracky/UI/Screen/List/SlidableListWidget.dart';

var border = OutlineInputBorder(borderRadius: BorderRadius.circular(32.0));

TextEditingController searchBar = TextEditingController();

class MySearchPage extends StatefulWidget {
  @override
  _MySearchPageState createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(20.0, 25, 20.0, 15.0)),
        Row(children: <Widget>[
          IconButton(
            icon: Icon(OMIcons.arrowBackIos),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return MySlidableListWidget(null);
                },
              ));
            },
          ),
          Flexible(
              child: TextField(
                  controller: searchBar,
                  decoration: InputDecoration(
                    hintText: "Search Product",
                    border: border,
                  )))
        ]),
      ],
    ));
  }
}
