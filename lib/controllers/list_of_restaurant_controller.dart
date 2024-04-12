import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodendra/models/restaurant.dart';
import 'package:foodendra/utils/apis.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestaurantListController extends GetxController {
  final restaurants = <Restaurant>[].obs;
  // final restaurants = <Map<String, dynamic>>[].obs;
  // final searchRestaurantResults = List<Map<String, dynamic>>.empty().obs;
  final searchRestaurantResults = <Restaurant>[].obs;
  RxBool searched = false.obs;
  final FocusNode focusNode = FocusNode();

  final TextEditingController searchRestaurantController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchRestaurants();
  }

  Future<void> fetchRestaurants() async {
    try {
      final response = await http.get(Uri.parse(Api.allResturantUrl));

      log("All restaurant response: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        restaurants.addAll(data
            .map((restaurant) =>
                Restaurant.fromJson(restaurant)) // Map to Restaurant instance
            .toList());
        update();
      } else {
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      log('Error fetching restaurants: $e');
    }
  }

  // Search feature
  Future<void> getSearchedRestaurant(String query) async {
    try {
      final response = await http
          .get(Uri.parse('${Api.searchRestaurantItemsResults}?query=$query'));

      log("search restaurant items response: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        searchRestaurantResults.assignAll(
          data.map((restaurant) => Restaurant.fromJson(restaurant)).toList(),
        );
      } else {
        throw Exception('Failed to search menu items');
      }
    } catch (e) {
      log('Error searching restaurant items: $e');
      Get.snackbar(
        'Error',
        'Failed to search restaurant items',
        // backgroundColor: Colors.red,
        // colorText: Colors.white,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        backgroundColor: Colors.red, // Change background color
        colorText: Colors.white, // Change text color
        borderRadius: 10, // Round the corners
        borderWidth: 2, // Add border
        borderColor: Colors.black.withOpacity(0.2), // Border color
        snackStyle: SnackStyle.FLOATING, // Display Snackbar as floating
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
      );
    }
  }
}
