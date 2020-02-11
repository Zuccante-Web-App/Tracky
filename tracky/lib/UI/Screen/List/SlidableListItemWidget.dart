import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:tracky/UI/Screen/List/SlidableListWidget.dart';

IconData star = OMIcons.starBorder;
bool isFavourite = true;

class SlidableListItemWidget extends StatefulWidget {
  
  String nome;
  String produttore;
  int prezzo;
  int index;
  GlobalKey<AnimatedListState> _productList;
  List<Product> _myList;
  List<bool> _boolList;
  List<IconData> _iconList;

  SlidableListItemWidget(this.nome, this.prezzo, this.index, this._productList,
      this._myList, this._boolList, this._iconList);

  @override
  _SlidableListItemWidgetState createState() => _SlidableListItemWidgetState();
}

class _SlidableListItemWidgetState extends State<SlidableListItemWidget> {
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;
    Color circleColorGreen;
    Color circleColorRed;
    //**Color */
    if(isDark){
      circleColorGreen = Colors.limeAccent[400];
      circleColorRed = Colors.deepOrange;
    }
    else{
      circleColorGreen = Colors.green;
      circleColorRed = Colors.red;
    }



    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        child: ListTile(
          title: Text(
            widget.nome,
          ),
          trailing: Container(
            child: CircleAvatar(
              foregroundColor: circleColorGreen,
                  child: Text(
                widget.prezzo.toString(),
                style: TextStyle(fontSize: 13),
              ),
            ),
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.limeAccent[400],
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: OMIcons.delete,
            onTap: delete),
        IconSlideAction(
          caption: 'Favorite',
          color: Colors.amber[300],
          icon: widget._iconList[widget.index],
          onTap: makeFavorite,
        ),
      ],
    );
  }

 

  Widget _buildItem(Product product, Animation animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(),
    );
  }

  void delete() {
    setState(() {
      Product removedProduct = widget._myList.removeAt(widget.index);
      AnimatedListRemovedItemBuilder builder = (context, animation) {
        return _buildItem(removedProduct, animation);
      };
      widget._productList.currentState.removeItem(widget.index, builder);
    });
  }

  void makeFavorite() {
    setState(() {
      Product favoriteProduct = widget._myList[widget.index];
      AnimatedListRemovedItemBuilder builder = (context, animation) {
        return _buildItem(favoriteProduct, animation);
      };
      widget._productList.currentState.removeItem(widget.index, builder);
      widget._myList.removeAt(widget.index);
      if (widget._boolList[widget.index]) {
        widget._boolList.removeAt(widget.index);
        widget._boolList.insert(widget.index, true);
        widget._iconList.removeAt(widget.index);
        widget._iconList.insert(widget.index, OMIcons.star);
        widget._myList.insert(widget._myList.length - 1, favoriteProduct);
      } else {
        widget._iconList.removeAt(widget.index);
        widget._iconList.insert(widget.index, OMIcons.starBorder);
        widget._myList.insert(0, favoriteProduct);
        widget._boolList.removeAt(widget.index);
        widget._boolList.insert(widget.index, false);
      }
      widget._productList.currentState.insertItem(widget.index);
    });
  }
}
