import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class NoticeBoardListItemWidget extends StatefulWidget {
  String nome;
  String descrizione;
  Icon star = Icon(OMIcons.starBorder);

  NoticeBoardListItemWidget(this.nome, this.descrizione);

  @override
  _NoticeBoardListItemWidgetState createState() =>
      _NoticeBoardListItemWidgetState();
}

class _NoticeBoardListItemWidgetState extends State<NoticeBoardListItemWidget> {
   IconData star = Icon(IconData());
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
            widget.descrizione,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Remove',
          color: Colors.red,
          icon: OMIcons.delete,
        ),
        IconSlideAction(
          caption: 'Favorite',
          color: Colors.amber,
          icon: star,
          onTap: ,
        ),
      ],
    );
  }
}