import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:tracky/Services/Database/Dao/dao.dart';
import 'package:tracky/Services/Database/Entities/currency.dart';
import 'package:tracky/Services/Database/Entities/product.dart' as DB;
import 'package:tracky/UI/Screen/List/SlidableListItemWidget.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:tracky/UI/Screen/Search/SearchPageWidget.dart';

class MySlidableListWidget extends StatefulWidget {

  final Dao dao;

  MySlidableListWidget(this.dao , {Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MySlidableListWidgetState createState() => _MySlidableListWidgetState();
}

class _MySlidableListWidgetState extends State<MySlidableListWidget> {

  void _deleteCallback(DB.Product product) {
    print("[INFO] Canncellando product ${product.name}");
     widget.dao.deleteProduct(product);
  }

  void _toggleFavouriteCallback(DB.Product product) {
    print("[INFO] Preferando product ${product.name}");
    product.isFavourite = ! product.isFavourite;
     widget.dao.updateProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(OMIcons.search),
            /*Apre Nuova Scheda*/
            padding: EdgeInsets.only(right: 25),
            tooltip: "Search Product",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return MySearchPage();
                },
              ));
            },
            alignment: AlignmentDirectional.centerStart,
          )
        ],
      ),
      body: Center(
        child: Container(
          child: StreamBuilder<List<DB.Product>>(
                    stream: widget.dao.getAllProductsAsStream(),
                    builder: (BuildContext context, AsyncSnapshot<List<DB.Product>> snapshot) {
                        if(!snapshot.hasData) return Container();
                        final products = snapshot.data;
                        products.sort();
                        return ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return SlidableListItemWidget(
                                product: products[index],
                                deleteCallback: _deleteCallback,
                                toggleFavouriteCallback: _toggleFavouriteCallback,
                            );
                          },
                        );
                    }
                  ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          widget.dao.insertCurrency(Currency(null, "\$"));
          widget.dao.insertProduct(DB.Product(null, "sii", "fantasioso", "filippo", 7,false, 1));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

