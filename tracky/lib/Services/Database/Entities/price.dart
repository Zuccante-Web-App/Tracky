import 'package:floor/floor.dart';
import '../Entities/product.dart';
@Entity(
	foreignKeys: [
		ForeignKey(
			childColumns: ['idProduct'],
			parentColumns: ['id'],
			entity: Product,
		)
	]
)
class Price {
	@PrimaryKey(autoGenerate: true)
	final int id;
	final int idProduct;
  	final String date;
  	final int amount;

	Price(this.id, this.idProduct, this.date, this.amount);
}