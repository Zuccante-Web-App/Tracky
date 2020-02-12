import 'package:floor/floor.dart';
import 'package:tracky/Services/Database/Entities/product.dart';
@dao
abstract class ProductDao {
	@Query('SELECT * FROM Product')
	Future<List<Product>> findAllProducts();

	@Query('SELECT * FROM Product WHERE id = :id')
	Future<Product> findProductById(int id);

	@insert
	Future<void> insertProduct(Product product);
}