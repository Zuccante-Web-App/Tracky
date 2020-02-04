import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:tracky/UI/Screen/List/SlidableListWidget.dart';

class SlidableListItemWidget extends StatefulWidget {
  String nome;
  int prezzo;
  int index;
  GlobalKey<AnimatedListState> _productList;
  List<Product> _myList;
  IconData star = OMIcons.starBorder;

  SlidableListItemWidget(
      this.nome, this.prezzo, this.index, this._productList, this._myList);

  @override
  _SlidableListItemWidgetState createState() => _SlidableListItemWidgetState();
}

class _SlidableListItemWidgetState extends State<SlidableListItemWidget> {
  bool isFavourite = true;
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
            onTap: delete),
         IconSlideAction(
          caption: 'Favorite',
          color: Colors.amber[300],
          icon: widget.star,
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
    print("ciao$isFavourite ");
    setState(() {
      /*if (isFavourite) {
        print("entrato nel if");
        isFavourite = false;
        widget.star = OMIcons.starBorder;
      } else {
        print(isFavourite);*/
        Product favoriteProduct = widget._myList[widget.index];
        AnimatedListRemovedItemBuilder builder = (context, animation) {
          return _buildItem(favoriteProduct, animation);
        };
        widget._productList.currentState.removeItem(widget.index, builder);
        widget._myList.removeAt(widget.index);
        widget._myList.insert(0, favoriteProduct);
        widget._productList.currentState.insertItem(widget.index); 
        //isFavourite = true;
    });
  }
}

