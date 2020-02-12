import 'package:floor/floor.dart';
import 'package:tracky/Services/Database/Entities/price.dart';
@dao
abstract class PriceDao {
	@Query('SELECT * FROM Price')
	Future<List<Price>> findAllPrices();

	@Query('SELECT * FROM Price WHERE id = :id')
	Future<Price> findPriceById(int id);

	@insert
	Future<void> insertPrice(Price price);

	@Query('SELECT Price.* FROM Price JOIN Product ON Price.idProduct = Product.id WHERE Product.id = :id LIMIT=1')
	Future<Price> findLatestPriceFromProductId(int id);
}