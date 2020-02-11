import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:tracky/Services/Network/Api/Simple/SummaryProduct.dart';
import 'APIResponse.dart';
import 'Simple/Product.dart';
import 'package:html/dom.dart';

const String PRODUCT_NAME_ID = "productTitle";
const String PRODUCT_PRODUCER_ID = "bylineInfo";
const String PRODUCT_PRICE_ID = "priceblock_ourprice";

const String SUMMARY_PRODUCT_LINK_CLASSES = "a-link-normal a-text-normal";  //viene usata anche per il nome
const String SUMMARY_PRODUCT_PRICE_CLASSES = "a-size-base a-link-normal s-no-hover a-text-normal";

Future<APIResponse<Product>> getProductByLink(String url) async {
  http.Response res = await http.get(url);
  if(res.statusCode >= 300 || res.statusCode < 200){
    return APIResponse<Product>(false);
  } else {
    Document doc = parse(res.body);
    String name = doc.getElementById(PRODUCT_NAME_ID).innerHtml.trim();
    String producer = doc.getElementById(PRODUCT_PRODUCER_ID).innerHtml.trim();
    double price = double.parse(
                        doc.getElementById(PRODUCT_PRICE_ID)
                        .innerHtml
                        .trim()
                        .split("&nbsp;")
                        [0]
                        .replaceAll(",", ".")
    );
    var a = Product(name: name, price: price, producer: producer);
    print(a);
    return APIResponse<Product>(true, a);
  }
}

Future<APIResponse<List<SummaryProduct>>> getSummaryProductsByKeyWord(String keyword) async {
  String url = "https://www.amazon.it/s?k=" + keyword;
  http.Response res = await http.get(url);
  if(res.statusCode >= 300 || res.statusCode < 200) return APIResponse<List<SummaryProduct>>(false);
  Document doc = parse(res.body);
  List<Element> productsLinkElements = doc.getElementsByClassName(SUMMARY_PRODUCT_LINK_CLASSES);
  int j = 0;
  List<SummaryProduct> products = [];
  for(Element e in productsLinkElements){
    if(e.attributes["class"] == SUMMARY_PRODUCT_PRICE_CLASSES) {
      String price = e.children[0].children[1].children[0].innerHtml.trim();
      products[j].price = price;
      j++;
    } else {
      String link = e.attributes["href"].trim();
      String name = e.children[0].innerHtml.trim();
      products.add(SummaryProduct(name: name, link: link));
    }
  }
  for(dynamic e in products) print(e);
}


void main() async {
  getProductByLink("https://www.amazon.it/Vans-Sk8-Hi-Checkerboard-Ginnastica-Sidestripe/dp/B07NCCL68W/ref=sr_1_1_sspa?__mk_it_IT=%C3%85M%C3%85%C5%BD%C3%95%C3%91&keywords=vans&qid=1580828324&sr=8-1-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyUFNPTlFCQ1ZCUEVSJmVuY3J5cHRlZElkPUEwMzY3NjQ2MjNTVlIwWlVNNjJFUCZlbmNyeXB0ZWRBZElkPUEwOTc3OTM2M1IxU1NQWEEzUDBERSZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU&th=1&psc=1");
}