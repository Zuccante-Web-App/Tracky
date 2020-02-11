import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:tracky/Services/Network/Api/APIResponse.dart';
import 'package:tracky/Services/Network/Api/Simple/Product.dart' as p;
import 'package:tracky/UI/Screen/HomePageWidget.dart';
import 'package:tracky/UI/Screen/List/SlidableListWidget.dart';
import 'package:tracky/Services/Network/Api/Api.dart' as api;

var border = OutlineInputBorder(borderRadius: BorderRadius.circular(32.0));

TextEditingController searchBar = TextEditingController();

class MySearchPage extends StatefulWidget {
  @override
  _MySearchPageState createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(20.0, 25, 20.0, 15.0)),
        Row(children: <Widget>[
          IconButton(
            icon: Icon(OMIcons.arrowBackIos),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return MySlidableListWidget();
                },
              ));
            },
          ),
          Flexible(
              child: TextField(
                  controller: searchBar,
                  decoration: InputDecoration(
                    hintText: "Search Product",
                    border: border,
                  ))),
          IconButton(
            icon: Icon(OMIcons.search),
             onPressed: getProduct)
        ]),
      ],
    ));
  }

  void getProduct(){
    
    Future<APIResponse<p.Product>> product = api.getProductByLink(searchBar.text);
    product.then((res){
      
    });
  }
}
