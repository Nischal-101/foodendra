import 'package:flutter/material.dart';
import 'package:foodendra/controllers/home_controller.dart';
import 'package:foodendra/views/pages/home_page.dart';
import 'package:foodendra/views/pages/restaurant_page.dart';
import 'package:foodendra/widgets/custom/home_button.dart';
import 'package:foodendra/widgets/custom/recommended_restaurant.dart';
import 'package:get/get.dart';

// class AllRecommendedResturantPageController extends GetxController {
//   final List<Map<String, dynamic>> recommendedRestaurants = [];

//   @override
//   void onInit() {
//     super.onInit();
//     fetchRecommendedRestaurants();
//   }

//   Future<void> fetchRecommendedRestaurants() async {
//     try {
//       final response =
//           await http.get(Uri.parse(Api.allRecommendedResturantUrl));

//       if (response.statusCode == 200) {
//         final List<dynamic> data = jsonDecode(response.body);
//         recommendedRestaurants.addAll(data
//             .map((restaurant) => {
//                   'restaurant_id': restaurant['restaurant_id'],
//                   'restaurant_name': restaurant['restaurant_name'],
//                   'avg_rating': restaurant['avg_rating'],
//                   'restaurant_address': restaurant['restaurant_address']
//                 })
//             .toList());
//         update();
//       } else {
//         throw Exception('Failed to load recommended restaurants');
//       }
//     } catch (e) {
//       log('Error fetching recommended restaurants: $e');
//     }
//   }
// }

class AllRecommendedResturantPage extends StatelessWidget {
  // final c = Get.put(AllRecommendedResturantPageController());
  final c = Get.put(HomepageController());

  AllRecommendedResturantPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recommended Restaurants',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the arrow color to white
        ),
      ),
      body: FutureBuilder(
        future: c.fetchRecommendedRestaurants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return ListView.builder(
                itemCount: c.recommendedRestaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = c.recommendedRestaurants[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle onTap
                      },
                      child: InkWell(
                        onTap: () {
                          // Restaurant r = Restaurant();
                          Get.to(
                            () => RestaurantHomePage(
                              restaurantName: restaurant.restaurantName ?? '',
                              restaurantRating: restaurant.avgRating.toString(),
                              restaurantLocation:
                                  restaurant.restaurantAddress ?? '',
                              restaurantDescription:
                                  restaurant.restaurantDescription ?? '',
                              imagePath: restaurant.restaurantImage ?? '',

                              // restaurantName: r.name ?? '',
                              // restaurantRating: r.name ?? '',
                              // restaurantLocation: r.address ?? '',
                              // restaurantDescription: r.description ?? '',
                            ),
                          );
                        },
                        child: RecommendedWidget(
                          restaurantName: restaurant.restaurantName ?? '',
                          restaurantRating: restaurant.avgRating.toString(),
                          restaurantLocation:
                              restaurant.restaurantAddress ?? '',
                          imagePath: restaurant.restaurantImage ?? '',
                          restaurantDecription:
                              restaurant.restaurantDescription ?? '',
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
      floatingActionButton: HomeButton(
        onPressed: () {
          // Define what should happen when the home button is pressed
          print('Home button pressed');
          Get.to(Homepage());
        },
      ),
    );
  }
}
