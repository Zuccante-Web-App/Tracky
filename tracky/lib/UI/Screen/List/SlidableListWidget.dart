
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:tracky/UI/Screen/List/SlidableListItemWidget.dart';


class MySlidableListWidget extends StatefulWidget {
  GlobalKey<AnimatedListState> _productList = GlobalKey<AnimatedListState>();
  List<String> _list;
  List<Product> _myList = [new Product('TelefonoX', 500,0)];  


  MySlidableListWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MySlidableListWidgetState createState() => _MySlidableListWidgetState();
}

class _MySlidableListWidgetState extends State<MySlidableListWidget> {
  String actualIndex = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bacheca'),),
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
                      widget._myList[index].index
              )
                  );
            }),
      ),
    );
  }
    void deleteProduct(int index){
     widget._myList.removeAt(index);
  }
}

 

class Product {
  String nome;
  int prezzo;
  int index;

  Product(this.nome, this.prezzo,this.index);
}

