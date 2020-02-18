import 'package:flutter/material.dart';
import 'package:tracky/UI/Screen/HomePageWidget.dart';

import 'Services/Database/Dao/dao.dart';
import 'Services/Database/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorAppDatabase
      .databaseBuilder('flutter_database.db')
      .build();
  final dao = database.dao;

  runApp(MyApp(dao));
}

class MyApp extends StatelessWidget {

  final Dao dao;

  MyApp(this.dao);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracky',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.light, primaryColor: Colors.amber),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.amber),
      home: HomePageWidget(dao),
    );
  }
}

