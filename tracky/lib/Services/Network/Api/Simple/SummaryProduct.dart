class SummaryProduct {
  String name, link, price;

  SummaryProduct({this.name, this.price, this.link});

  @override
  String toString() {
    return "{ $name, $price , $link}";
  }

}