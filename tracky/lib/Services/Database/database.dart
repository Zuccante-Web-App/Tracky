// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;   

import 'Dao/dao.dart';
import 'Entities/currency.dart';
import 'Entities/price.dart';
import 'Entities/product.dart';   

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Price, Currency, Product])
abstract class AppDatabase extends FloorDatabase {
	Dao get dao;
}