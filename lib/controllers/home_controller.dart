// import 'dart:convert';
// import 'dart:developer';
// import 'package:foodendra/utils/apis.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class HomepageController extends GetxController {
//   final recommendedRestaurants = <Map<String, dynamic>>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchRecommendedRestaurants();
//   }

//   Future<void> fetchRecommendedRestaurants() async {
//     try {
//       final response =
//           await http.get(Uri.parse(Api.allRecommendedResturantUrl));

//       log("Recommended Resturant list: ${response.body}");

//       if (response.statusCode == 200) {
//         final List<dynamic> data = jsonDecode(response.body);
//         recommendedRestaurants.addAll(data
//             .map((restaurant) => {
//                   'restaurant_id': restaurant['restaurant_id'],
//                   'restaurant_name': restaurant['restaurant_name'],
//                   'avg_rating': restaurant['avg_rating'],
//                   'restaurant_address': restaurant['restaurant_address'],
//                   'restaurant_description':
//                       restaurant['restaurant_description'],
//                   'restaurant_image': restaurant['restaurant_image'],
//                 })
//             .toList());
//         update(); // Update the UI
//       } else {
//         throw Exception('Failed to load recommended restaurants');
//       }
//     } catch (e) {
//       log('Error fetching recommended restaurants: $e');
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'package:foodendra/models/restaurant.dart'; // Import your Restaurant model
import 'package:foodendra/utils/apis.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomepageController extends GetxController {
  final recommendedRestaurants = <Restaurant>[].obs; // Change the type to List<Restaurant>

  @override
  void onInit() {
    super.onInit();
    fetchRecommendedRestaurants();
  }

  Future<void> fetchRecommendedRestaurants() async {
    try {
      final response =
          await http.get(Uri.parse(Api.allRecommendedResturantUrl));

      log("Recommended Restaurant list: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        recommendedRestaurants.addAll(data
            .map((restaurant) => Restaurant.fromJson(restaurant)) // Map to Restaurant instance
            .toList());
        update(); // Update the UI
      } else {
        throw Exception('Failed to load recommended restaurants');
      }
    } catch (e) {
      log('Error fetching recommended restaurants: $e');
    }
  }
}
