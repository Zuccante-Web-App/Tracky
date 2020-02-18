import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:tracky/Services/Database/Entities/currency.dart';
import 'package:tracky/Services/Database/Entities/price.dart';
import 'package:tracky/Services/Database/Entities/product.dart';
@dao
abstract class Dao {
  /*
  * CURRENCY
  */
	@Query('SELECT * FROM Currency')
	Future<List<Currency>> getAllCurrencies();

	@Query('SELECT * FROM Currency WHERE id = :id')
	Future<Currency> getCurrencyById(int id);

	@insert
	Future<void> insertCurrency(Currency currency);


  /*
   * PRICE
   */
  @Query('SELECT * FROM Price')
	Future<List<Price>> getAllPrices();

	@Query('SELECT * FROM Price WHERE id = :id')
	Future<Price> getPriceById(int id);

	@insert
	Future<void> insertPrice(Price price);

	@Query('SELECT Price.* FROM Price JOIN Product ON Price.idProduct = Product.id WHERE Product.id = :id LIMIT=1')
	Future<Price> getLatestPriceFromProductId(int id);


  /*
  * PRODUCT
  */
  @Query('SELECT * FROM Product')
  Stream<List<Product>> getAllProductsAsStream();

  @Query('SELECT * FROM Product')
	Future<List<Product>> getAllProducts();

  @Query('SELECT * FROM Product WHERE isFavourite')
  Stream<List<Product>> getAllFavouriteProductsAsStream();

  @Query('SELECT * FROM Product WHERE not isFavourite')
  Stream<List<Product>> getAllNonFavouriteProductsAsStream();

	@Query('SELECT * FROM Product WHERE id = :id')
	Future<Product> getProductById(int id);

	@insert
	Future<void> insertProduct(Product product);

  @delete
  Future<void> deleteProduct(Product product);

  @update
  Future<void> updateProduct(Product product);

}