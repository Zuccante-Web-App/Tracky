import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'Api/APIResponse.dart';
import 'Api/Simple/Product.dart';
import 'package:html/dom.dart';

const String PRODUCT_NAME_ID = "productTitle";
const String PRODUCT_PRODUCER_ID = "bylineInfo";
const String PRODUCT_PRICE_ID = "priceblock_ourprice";

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
    return APIResponse<Product>(true, Product(name: name, price: price, producer: producer));
  }
}

void main() async {
  var a = await getProductByLink("https://www.amazon.it/AmazonBasics-Mouse-USB-3-pulsanti/dp/B005EJH6RW/ref=sr_1_1_sspa?__mk_it_IT=%C3%85M%C3%85%C5%BD%C3%95%C3%91&keywords=mouse&qid=1580548681&sr=8-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExT1VSQldPUUpLSVcmZW5jcnlwdGVkSWQ9QTAxMDkyNTYxMTUySURPOEpPU1U2JmVuY3J5cHRlZEFkSWQ9QTA3NTI1MTJUTU9TODlLMUxJUTQmd2lkZ2V0TmFtZT1zcF9hdGYmYWN0aW9uPWNsaWNrUmVkaXJlY3QmZG9Ob3RMb2dDbGljaz10cnVl");
  print(a.data); 
}