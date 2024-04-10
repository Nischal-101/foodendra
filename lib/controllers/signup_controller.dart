import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodendra/utils/storage_key.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:foodendra/utils/apis.dart';
import 'package:foodendra/views/pages/home_page.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> onSubmit() async {
    String username = usernameController.text;
    String email = emailController.text;
    String address = addressController.text;
    String phoneNumber = phoneNumberController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    ///Getting error can't find so commented7
    // Validate password and confirmPassword
    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // API endpoint URL
    String url = Api.registerUrl;
    String urlLogin = Api.loginUrl;
    String type = 'restaurant';

    // Request body
    Map<String, String> body = {
      'username': username,
      'email': email,
      'address': address,
      'phone_number': phoneNumber,
      'password': password,
      'type': type,
    };

    try {
      http.Response response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == 'success') {
          ///entering login process login auto hunxa
          log("------------Entering Login Process---------");

          try {
            log("------------Entered ✔️ 😎Login Process---------");

            http.Response responseLogin =
                await http.post(Uri.parse(urlLogin), body: body);

            log("------------Entered ✔️ 😎Login Process 2---------");

            log("Login Response: ${responseLogin.body}");

            if (responseLogin.statusCode == 200) {
              log("------------Entered ✔️ 😎Login Process 3---------");

              Map<String, dynamic> jsonResponse =
                  jsonDecode(responseLogin.body);

              if (jsonResponse['status'] == 'success') {
                log("------------Entered ✔️ 😎Login Process 4---------");
                // Save user data and token using StorageHelper
                await StorageHelper.saveUser(jsonResponse['user']);
                await StorageHelper.saveToken(jsonResponse['token']);

                log('User: ${StorageHelper.getUser()}');
                log('Token: ${StorageHelper.getToken()}');
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
            Get.snackbar('Error', 'An error occurred. Please try again later.',
                snackPosition: SnackPosition.BOTTOM);
          }
        } else {
          String errorMessage = jsonResponse['message'];
          Get.snackbar('Error', errorMessage,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar('Error', 'Failed to signup. Please try again later.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred. Please try again later.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
