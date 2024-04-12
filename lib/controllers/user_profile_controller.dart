import 'package:foodendra/models/user.dart';
import 'package:foodendra/utils/storage_key.dart';
import 'package:foodendra/views/pages/home_page.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:foodendra/utils/apis.dart';
import 'package:http/http.dart' as http;

class UserProfilePageController extends GetxController {
  late Rx<User?> user;

  @override
  void onInit() {
    super.onInit();
    user = StorageHelper.getUser()?.obs ?? User().obs;
  }

  Future<void> updateUserInfo(
      String username, String email, String address, String phoneNumber) async {
    try {
      // Retrieve user data from storage
      final user = StorageHelper.getUser();

      if (user != null) {
        final userId = user.userId;

        log("The logged in user: $userId");

        final response = await http.post(
          Uri.parse(Api.getUpdateProfileUrl),
          body: {
            'user_id': userId.toString(),
            'username': username,
            'email': email,
            'address': address,
            'phone_number': phoneNumber,
          },
        );

        log("The update user info resp: ${response.body}");

        final responseData = json.decode(response.body);

        if (response.statusCode == 200 && responseData['status'] == 'success') {
          Get.snackbar("Success", responseData['message']);
          // Update user data in storage
          final updatedUserData = user.toJson()
            ..addAll({
              'username': username,
              'email': email,
              'address': address,
              'phoneNumber': phoneNumber,
            });
          await StorageHelper.saveUser(updatedUserData);

          // Update user data in controller
          this.user(User.fromJson(updatedUserData));
          Get.offAll(() => Homepage());
          log('User info updated successfully');
        } else {
          throw Exception('Failed to update user info');
        }
      } else {
        throw Exception('User data not found');
      }
    } catch (e) {
      log('Error updating user info: $e');
    }
  }

  
}
