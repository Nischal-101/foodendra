
import 'package:foodendra/models/add_to_cart.dart';
import 'package:foodendra/utils/apis.dart';
import 'package:http/http.dart' as http;

class CartController {
  // static const String baseUrl = 'http://your-api-url.com'; // Update this with your API base URL

  Future<String> addItemToCart(CartItem item) async {
    final response = await http.post(
      Uri.parse(Api.getAddToCartUrl),
      body: item.toJson(),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to add item to cart');
    }
  }

  
}
