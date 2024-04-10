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
          Get.offAll(Homepage());
        } else {
          String errorMessage = jsonResponse['message'];
          Get.snackbar('Error', errorMessage,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar('Error', 'Failed to login. Please try again later.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred. Please try again later. $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
