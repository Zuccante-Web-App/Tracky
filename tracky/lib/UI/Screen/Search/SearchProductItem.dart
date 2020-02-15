import 'package:flutter/material.dart';

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
        body: Container(
      child: Row(
        children: <Widget>[
          Flexible(
              child: ListTile(
            title: Text(widget.name),
            subtitle: Text(widget.producer),
            trailing: Text(
              widget.price.toString(),
            ),
          ))
        ],
      ),
    ));
  }
}
