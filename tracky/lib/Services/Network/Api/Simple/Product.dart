class Product {
  String name;
  String producer; 
  double price;

  Product({this.name, this.producer, this.price});

  @override
  String toString(){
    return "$name - $producer - $price";
  }

}