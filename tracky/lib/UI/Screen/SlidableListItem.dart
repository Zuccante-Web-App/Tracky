import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NoticeBoardListItemWidget extends StatefulWidget {
  String nome;
  String descrizione;

  NoticeBoardListItemWidget(this.nome, this.descrizione);

  @override
  _NoticeBoardListItemWidgetState createState() =>
      _NoticeBoardListItemWidgetState();
}

class _NoticeBoardListItemWidgetState extends State<NoticeBoardListItemWidget> {
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
          caption: 'Save',
          color: Colors.blue,
          icon: OMIcons.save,
          onTap: () => save,
        ),
        IconSlideAction(
          caption: 'Readed',
          color: Colors.indigo,
          icon: OMIcons.done,
          onTap: () => readed,
        ),
      ],
    );
  }
}