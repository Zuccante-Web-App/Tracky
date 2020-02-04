import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:tracky/UI/Screen/List/SlidableListItemWidget.dart';

class MySlidableListWidget extends StatefulWidget {
  GlobalKey<AnimatedListState> _productList = GlobalKey<AnimatedListState>();
  List<String> _list;
  List<Product> _myList = [new Product('TelefonoX', 500), new Product('nome', 1221), new Product("p3", 111)];

  MySlidableListWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MySlidableListWidgetState createState() => _MySlidableListWidgetState();
}

class _MySlidableListWidgetState extends State<MySlidableListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('La tua lista')),
      body: Center(
        child: AnimatedList(
            key: widget._productList,
            initialItemCount: widget._myList.length,
            itemBuilder: (context, index, animation) {
              return ScaleTransition(
                scale: animation,
                child: SlidableListItemWidget(
                  widget._myList[index].nome,
                  widget._myList[index].prezzo,
                  index,
                  widget._productList,
                  widget._myList,
                ),
              );
            }),
      ),
    );
  }
}

class Product {
  String nome;
  int prezzo;
  int index;
  Key key;

  Product(
    this.nome,
    this.prezzo,
  );
}
