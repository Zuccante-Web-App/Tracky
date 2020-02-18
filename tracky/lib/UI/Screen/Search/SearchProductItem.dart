import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class SearchProductItem extends StatefulWidget {
  @override
  String name;
  String producer;
  double price;
  SearchProductItem(this.name, this.price, this.producer);
  _SearchProductItemState createState() => _SearchProductItemState();
}

class _SearchProductItemState extends State<SearchProductItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Searched Product"),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: ListTile(
                      title: Text(
                        widget.name,
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        widget.producer,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              Image.asset("assets/yodino.jpg", fit: BoxFit.fitWidth),
              Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
              Row(
                children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                Align(
                  child: Text("Actual Price:",
                      style:
                          TextStyle(color: Color.fromRGBO(140, 140, 140, 55))),
                  alignment: AlignmentDirectional.topStart,
                ),
              ]),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                  Text(
                    "${widget.price.toString()} €",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              Align(
                  child: FloatingActionButton(
                    onPressed: addToDB,
                    backgroundColor: Colors.amberAccent[200],
                    child: Icon(
                      OMIcons.starBorder,
                      color: Colors.black,
                    ),
                  ),
                  alignment: AlignmentDirectional.topEnd)
            ],
          ),
        ));
  }
}

void addToDB(){

}
