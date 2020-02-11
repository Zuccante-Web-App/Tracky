import 'package:floor/floor.dart';
import 'package:tracky/Services/Database/Entities/currency.dart';
@dao
abstract class CurrencyDao {
	@Query('SELECT * FROM Currency')
	Future<List<Currency>> findAllCurrencies();

	@Query('SELECT * FROM Currency WHERE id = :id')
	Future<Currency> findCurrencyById(int id);

	@insert
	Future<void> insertCurrency(Currency currency);
}