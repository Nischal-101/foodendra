import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodendra/utils/apis.dart';
import 'package:foodendra/utils/storage_key.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartItemsViewController extends GetxController {
  var restaurantsWithMenuItems = {}.obs;

  get selectedPaymentMethod => null;

  @override
  void onInit() {
    super.onInit();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    final user = StorageHelper.getUser();

    try {
      if (user != null) {
        final userId = user.userId;

        log("The get cart user: $userId");

        final response = await http.post(
          Uri.parse(Api.getFetchAddToCartByResUrl),
          body: {'user_id': userId},
        );

        log("The cart items get: ${response.body}");

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);

          restaurantsWithMenuItems.value = data;
        } else {
          log('Failed to fetch cart items');
        }
      } else {
        throw Exception('User data not found');
      }
    } catch (e) {
      log('Error fetching cart items: $e');
    }
  }

  // Method to handle checkout

  Future<void> checkout(BuildContext context, String restaurantId) async {
    final user = StorageHelper.getUser();

    try {
      if (user != null) {
        final userId = user.userId;

        final totalAmount = calculateTotal(
            restaurantsWithMenuItems[restaurantId.toString()]['menu_items']);

        // final deliveryAddress = await getDeliveryAddress(context);
        const deliveryAddress = "Kathmandu";

        final menuItems =
            restaurantsWithMenuItems[restaurantId.toString()]['menu_items'];

        final response = await http.post(
          Uri.parse(Api.checkoutUrl),
          body: {
            'user_id': userId,
            'restaurant_id': restaurantId.toString(),
            'total_amount': totalAmount.toStringAsFixed(2),
            'delivery_address': deliveryAddress,
            'status': 'pending',
            'menu_items': jsonEncode(menuItems
                .map((item) => {
                      'item_id': item['item_id'],
                      'quantity': item['quantity'],
                    })
                .toList()),
          },
        );

        if (response.statusCode == 200) {
          await removeCart(context, restaurantId);
          Get.snackbar(
            'Success', 'Order placed successfully',
            duration: const Duration(seconds: 2),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            backgroundColor: Colors.white, // Change background color
            colorText: Colors.black, // Change text color
            borderRadius: 10, // Round the corners
            borderWidth: 2, // Add border
            borderColor: Colors.black.withOpacity(0.2), // Border color
            snackStyle: SnackStyle.FLOATING, // Display Snackbar as floating
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to place order')),
          );
        }

        log("Checkout response: ${response.body}");
      } else {
        throw Exception('User data not found');
      }
    } catch (e) {
      log('Error during checkout: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error during checkout')),
      );
    }
  }

  // Future<void> checkout(BuildContext context, String restaurantId) async {
  //   final user = StorageHelper.getUser();

  //   try {
  //     if (user != null) {
  //       final userId = user.userId;

  //       final totalAmount = calculateTotal(
  //           restaurantsWithMenuItems[restaurantId.toString()]['menu_items']);
  //       const deliveryAddress = ''; // Add delivery address here

  //       final menuItems =
  //           restaurantsWithMenuItems[restaurantId.toString()]['menu_items'];

  //       final response = await http.post(
  //         Uri.parse(Api.checkoutUrl),
  //         body: {
  //           'user_id': userId,
  //           'restaurant_id': restaurantId.toString(),
  //           'total_amount': totalAmount.toStringAsFixed(2),
  //           'delivery_address': deliveryAddress,
  //           'menu_items': jsonEncode(menuItems
  //               .map((item) => {
  //                     'item_id': item['item_id'],
  //                     'quantity': item['quantity'],
  //                   })
  //               .toList()),
  //         },
  //       );

  //       if (response.statusCode == 200) {
  //         // await removeCart(context, restaurantId);
  //         // restaurantsWithMenuItems.clear();
  //         // fetchCartItems();

  //         Get.snackbar(
  //           'Success', 'Order placed successfully',
  //           duration: const Duration(seconds: 2),
  //           snackPosition: SnackPosition.TOP,
  //           margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
  //           backgroundColor: Colors.white, // Change background color
  //           colorText: Colors.black, // Change text color
  //           borderRadius: 10, // Round the corners
  //           borderWidth: 2, // Add border
  //           borderColor: Colors.black.withOpacity(0.2), // Border color
  //           snackStyle: SnackStyle.FLOATING, // Display Snackbar as floating
  //           padding: const EdgeInsets.symmetric(
  //             vertical: 12,
  //             horizontal: 24,
  //           ),
  //         );

  //         // If checkout successful, show success message
  //         // ScaffoldMessenger.of(context).showSnackBar(
  //         //   const SnackBar(
  //         //       content: Text(
  //         //     'Order placed successfully',
  //         //   )),
  //         // );
  //       } else {
  //         // If checkout failed, show error message
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text('Failed to place order')),
  //         );
  //       }

  //       log("Checkout response: ${response.body}");
  //     } else {
  //       throw Exception('User data not found');
  //     }
  //   } catch (e) {
  //     log('Error during checkout: $e');
  //     // Show error message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Error during checkout')),
  //     );
  //   }
  // }

  double calculateTotal(List<dynamic> menuItems) {
    try {
      double total = 0.0;
      for (var item in menuItems) {
        total += double.parse(item['total'].toString());
      }
      return total;
    } catch (e) {
      // Handle any errors during calculation
      log('Error calculating total: $e');
      return 0.0; // Return a default value in case of error
    }
  }

  // Method to remove items from cart
  Future<void> removeCart(BuildContext context, String restaurantId) async {
    final user = StorageHelper.getUser();

    try {
      if (user != null) {
        final response = await http.post(
          Uri.parse(Api.removeItemsFromCartUrl),
          body: {
            'restaurant_id': restaurantId.toString(),
          },
        );

        if (response.statusCode == 200) {
          // // If removal successful, show success message
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('Items removed from cart')),
          // );
          Get.snackbar(
            'Success', 'Items removed from cart',
            duration: const Duration(seconds: 2),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            backgroundColor: Colors.white, // Change background color
            colorText: Colors.black, // Change text color
            borderRadius: 10, // Round the corners
            borderWidth: 2, // Add border
            borderColor: Colors.black.withOpacity(0.2), // Border color
            snackStyle: SnackStyle.FLOATING, // Display Snackbar as floating
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
          );
        } else {
          // If removal failed, show error message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to remove items from cart')),
          );
        }

        log("Remove cart response: ${response.body}");
      } else {
        throw Exception('User data not found');
      }
    } catch (e) {
      log('Error removing items from cart: $e');
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error removing items from cart')),
      );
    }
  }

  Future<void> removeSingleCartItem(String id, String restaurantId) async {
    try {
      // Check if the provided restaurantId is valid
      if (restaurantId.isEmpty) {
        throw Exception("Invalid restaurant ID");
      }

      log("The item_id removed: $id");
      log("The restaurant_id removed: $restaurantId");

      // Use the provided restaurantId directly without reassigning
      final response = await http.post(
        Uri.parse(Api.removeSingleItemsFromCartUrl),
        body: {
          'item_id': id.toString(),
          'restaurant_id': restaurantId.toString(),
        },
      );

      if (response.statusCode == 200) {
        // Assuming fetchCartItems updates restaurantsWithMenuItems
        fetchCartItems(); // Fetch updated cart items
        // Get.snackbar("Success", "Item removed from cart");
        Get.snackbar(
          "Success",
          "Item removed from cart",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          backgroundColor: Colors.white, // Change background color
          colorText: Colors.black, // Change text color
          borderRadius: 10, // Round the corners
          borderWidth: 2, // Add border
          borderColor: Colors.black.withOpacity(0.2), // Border color
          snackStyle: SnackStyle.FLOATING, // Display Snackbar as floating
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ), // Adjust padding
        );
      } else {
        Get.snackbar(
          "Error", "Failed to remove items from cart",
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

      log("Remove cart response: ${response.body}");
    } catch (e) {
      log('Error removing items from cart: $e');
      Get.snackbar(
        "Error", "Error removing items from cart",
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

  // Future<void> removeSingleCartItem(String id, String restaurantId) async {
  //   // const int itemId = 20;

  //   try {
  //     for (final entry in restaurantsWithMenuItems.entries) {
  //       if (entry.value.containsKey(id)) {
  //         restaurantId = entry.key;
  //         break;
  //       }
  //     }
  //     // final userId = user.userId;
  //     // final restaurantId = restaurantsWithMenuItems.keys.first;
  //     print("The item id removed: $id");
  //     print("The restaurant removed: $restaurantId");
  //     // print(restaurantId);
  //     final response = await http.post(
  //       Uri.parse(Api.removeItemsFromCartUrl),
  //       body: {
  //         'item_id': id.toString(),
  //         'restaurant_id': restaurantId.toString(),
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       // restaurantsWithMenuItems.clear();
  //       fetchCartItems();
  //       Get.snackbar("Success", "Items removed from cart");
  //     } else {
  //       Get.snackbar("Error", "Failed to remove items from cart");
  //     }

  //     log("Remove cart response: ${response.body}");
  //   } catch (e) {
  //     log('Error removing items from cart: $e');

  //     Get.snackbar("Error", "Error removing items from cart");
  //   }
  // }
}
