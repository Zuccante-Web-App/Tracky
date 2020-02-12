import 'package:floor/floor.dart';
import '../Entities/currency.dart';
@Entity(
	foreignKeys: [
		ForeignKey(
			childColumns: ['idCurrency'],
			parentColumns: ['id'],
			entity: Currency,
		)
	]
)
class Product {
    @PrimaryKey(autoGenerate: true)
	final int id;
  	final String name;
	final String link;
	final String seller;
	final int targetAmount;

	final int idCurrency;

	Product(this.id, this.name, this.link, this.seller, this.targetAmount, this.idCurrency);
}