import 'package:floor/floor.dart';

@entity
class Currency {
	@PrimaryKey(autoGenerate: true)
	final int id;
	final String symbol;
	Currency(this.id, this.symbol);
}