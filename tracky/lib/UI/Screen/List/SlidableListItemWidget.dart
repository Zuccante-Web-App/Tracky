import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:tracky/Services/Database/Entities/product.dart';


class SlidableListItemWidget extends StatefulWidget {
  Product product;
  Function(Product) deleteCallback;
  Function(Product) toggleFavouriteCallback;

  SlidableListItemWidget({
    @required this.product,
    @required this.deleteCallback,
    @required this.toggleFavouriteCallback
  }){
    if(product == null) print("MOTHERFATHER");
    print(">>>> ${product.name}");
  }

  @override
  _SlidableListItemWidgetState createState() => _SlidableListItemWidgetState();
}

class _SlidableListItemWidgetState extends State<SlidableListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(
            widget.product.name,
            style: TextStyle(color: Colors.black),
          ),
          trailing: Container(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.green,
              child: Text(
                widget.product.targetAmount.toString(),
                style: TextStyle(fontSize: 13),
              ),
            ),
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
      direction: Axis.horizontal,
      actions: <Widget>[
        IconSlideAction(
          caption: 'Favorite',
          color: Colors.amber[300],
          icon: (widget.product.isFavourite)? Icons.star : OMIcons.starBorder,
          onTap: () => widget.toggleFavouriteCallback(widget.product),
        ),
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: OMIcons.delete,
            onTap: () => widget.deleteCallback(widget.product)
        ),
      ],
    );
  }

}
