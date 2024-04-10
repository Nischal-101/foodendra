import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodendra/utils/apis.dart';
import 'package:foodendra/utils/storage_key.dart';
import 'package:foodendra/views/pages/cart_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ItemDetailsViewController extends GetxController {
  RxInt quantity = 1.obs;

  void incrementQuantity() {
    if (quantity.value < 10) {
      quantity++;
    }
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity--;
    }
  }

  Future<void> addToCart(
      String restaurantId, String itemId, String price) async {
    try {
      // Retrieve user data from storage
      final user = StorageHelper.getUser();

      if (user != null) {
        final userId = user.userId;

        log("The ad cart user: $userId");

        final response = await http.post(
          Uri.parse(Api.getAddToCartUrl),
          body: {
            'user_id': userId.toString(),
            'restaurant_id': restaurantId,
            'item_id': itemId,
            'quantity':
                quantity.value.toString(), // Add quantity to the request body
            'total': (quantity.value * double.parse(price))
                .toString(), // Calculate and add total to the request body
          },
        );

        log("The add cart resp: ${response.body}");

        if (response.statusCode == 200) {
          // Show a snackbar with a hyperlink text
          Get.snackbar(
            "Success",
            "Item added to cart successfully",
            duration: const Duration(seconds: 3),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            backgroundColor: Colors.white, // Change background color
            colorText: Colors.black, // Change text color
            borderRadius: 10, // Round the corners
            borderWidth: 2, // Add border
            borderColor: Colors.black.withOpacity(0.2), // Border color
            // elevation: 5, // Add elevation
            snackStyle: SnackStyle.FLOATING, // Display Snackbar as floating
            padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 24), // Adjust padding
            mainButton: TextButton(
              onPressed: () {
                
                Get.to(() => CartItemsView());
              },
              child: const Text(
                'View Cart',
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
          );

          log('Item added to cart successfully');
        } else {
          throw Exception('Failed to add item to cart');
        }
      } else {
        throw Exception('User data not found');
      }
    } catch (e) {
      log('Error adding item to cart: $e');
      // You can show an error message here if needed
    }
  }
}
