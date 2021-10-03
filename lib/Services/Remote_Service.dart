import 'package:http/http.dart' as http;
import 'package:youtube_task/Constants.dart';
import 'package:youtube_task/Models/Product.dart';

class RemoteService {
  static var client = http.Client();

  static fetchProducts() async {
    var response = await client.get(Uri.parse(kProductsAPIUrl));
    print(response.body);
    if (response.statusCode == 200) {
      var JsonString = response.body;
      return productFromJson(JsonString);
    } else {
      return null;
    }
  }
}
