import 'package:flutter/material.dart';
import 'package:foodendra/controllers/list_of_restaurant_controller.dart';
import 'package:foodendra/models/restaurant.dart';
import 'package:foodendra/views/pages/home_page.dart';
import 'package:foodendra/views/pages/restaurant_page.dart';
import 'package:foodendra/widgets/custom/home_button.dart';
import 'package:get/get.dart';

class RestaurantList extends StatelessWidget {
  RestaurantList({super.key});

  final c = Get.put(RestaurantListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Restaurant List'),
      //   backgroundColor: Colors.deepOrange,
      // ),
      appBar: AppBar(
        title: const Text(
          'Restaurant List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search, color: Colors.grey),
                    onPressed: () {
                      c.getSearchedRestaurant(
                          c.searchRestaurantController.text);
                      c.focusNode.unfocus(); // Unfocus the TextField
                    },
                  ),
                  hintText: "Wanna find you perfect place?",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (value) {
                  c.getSearchedRestaurant(value);
                },
              ),
            ),
            const SizedBox(height: 15),
            Obx(() {
              if (c.searchRestaurantResults.isEmpty) {
                return const Text('No results found');
              } else {
                return SizedBox(
                  height: 600,
                  child: ListView.builder(
                    itemCount: c.searchRestaurantResults.length,
                    itemBuilder: (context, index) {
                      final restaurant = c.searchRestaurantResults[index];

                      final restaurantObject = Restaurant.fromJson(restaurant);
                      return InkWell(
                        onTap: () {
                          Get.to(() => RestaurantHomePage(
                                restaurantName:
                                    restaurantObject.restaurantName ?? '',
                                restaurantRating:
                                    restaurantObject.avgRating ?? '',
                                restaurantLocation:
                                    restaurantObject.restaurantAddress ?? '',
                                restaurantDescription:
                                    restaurantObject.restaurantDescription ??
                                        '',
                                imagePath:
                                    restaurantObject.restaurantImage ?? '',

                                //   restaurantName: restaurantName,
                                //   restaurantRating: restaurantRating,
                                //   restaurantLocation: restaurantLocation,
                              ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(restaurantObject
                                                  .restaurantImage ??
                                              ''))),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      restaurant['name'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${restaurant['address']}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
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
