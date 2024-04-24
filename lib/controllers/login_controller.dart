import 'package:flutter/material.dart';
import 'package:foodendra/utils/apis.dart';
import 'package:foodendra/utils/storage_key.dart';
import 'package:foodendra/views/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> onSubmit() async {
    String email = emailController.text;
    String password = passwordController.text;
    String type = 'customer';

    String url = Api.loginUrl;

    Map<String, String> body = {
      'email': email,
      'password': password,
      'type': type,
    };

    try {
      http.Response response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == 'success') {
          // Save user data and token using StorageHelper
          await StorageHelper.saveUser(jsonResponse['user']);
          await StorageHelper.saveToken(jsonResponse['token']);

          // print('User: ${StorageHelper.getUser()}');
          // print('Token: ${StorageHelper.getToken()}');

          // Navigate to home page
          Get.snackbar(
            "Success",
            "Login successful",
            duration: const Duration(seconds: 10),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            backgroundColor:
                Color.fromARGB(255, 20, 179, 25), // Change background color
            colorText: Colors.white, // Change text color
            borderRadius: 10, // Round the corners
            borderWidth: 2, // Add border
            // borderColor: Colors.black.withOpacity(0.2), // Border color
            // elevation: 5, // Add elevation
            snackStyle: SnackStyle.FLOATING, // Display Snackbar as floating
            padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 24), // Adjust padding
          );
          Get.offAll(Homepage());
        } else {
          String errorMessage = jsonResponse['message'];
          Get.snackbar(
            'Error', errorMessage,
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
        
      } else {
        Get.snackbar(
          'Error', 'Failed to login. Please try again later.',
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
    } catch (e) {
      Get.snackbar(
        'Error', 'An error occurred. Please try again later. $e',
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
