import 'package:floor/floor.dart';
import 'package:tracky/Services/Network/Api/Simple/Product.dart';
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
class Product implements Comparable<Product>{
  
  @PrimaryKey(autoGenerate: true)
	final int id;
  final String name;
	final String link;
	final String seller;
	final int targetAmount;
  bool isFavourite;
	final int idCurrency;

	Product(this.id, this.name, this.link, this.seller, this.targetAmount, this.isFavourite, this.idCurrency);

  @override
  int compareTo(Product p) {
    if((isFavourite && p.isFavourite) || (!isFavourite && !p.isFavourite)) return id.compareTo(p.id);
    if(isFavourite && !p.isFavourite) return -1;
    return 1;
  }

}