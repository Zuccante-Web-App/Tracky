import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:tracky/UI/Screen/List/SlidableListWidget.dart';

class SlidableListItemWidget extends StatefulWidget {
  String nome;
  int prezzo;
  int index;

  SlidableListItemWidget(this.nome, this.prezzo, this.index);

  @override
  _SlidableListItemWidgetState createState() =>
      _SlidableListItemWidgetState();
}

class _SlidableListItemWidgetState extends State<SlidableListItemWidget> {
  //Icon star = Icon(OMIcons.starBorder);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(
            widget.nome,
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            widget.prezzo.toString(),
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: OMIcons.delete,
          onTap:(){
            MySlidableListWidget.deleteProduct(widget.index);
          }
        ),
        IconSlideAction(
          caption: 'Favorite',
          color: Colors.amber[300],
          icon: OMIcons.starBorder,
        ),
      ],
    );
  }
}

