import 'package:flutter/material.dart';
import 'package:foodendra/models/user.dart';
import 'package:foodendra/views/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/storage_key.dart';

class CoreController extends GetxController {
  Rx<User?> currentUser = Rxn<User>();
  RxString userToken = "".obs;
  @override
  void onInit() async {
    await loadCurrentUser();
    super.onInit();
  }

  Future<void> loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
    userToken.value = StorageHelper.getToken();
  }

  bool isUserLoggedIn() {
    return currentUser.value != null;
  }

  void logOut() async {
    final box = GetStorage();
    await box.write(StorageKeys.USER, null);
    loadCurrentUser();
    Get.offAll(LoginScreen());
    Get.snackbar(
      'Logged Out',
      'You have been successfully logged out.',
      duration: const Duration(seconds: 20),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      borderRadius: 10, // Round the corners
      borderWidth: 2, // Add border
      // borderColor: Colors.black.withOpacity(0.2), // Border color
      // elevation: 5, // Add elevation
      snackStyle: SnackStyle.FLOATING, // Display Snackbar as floating
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    );
  }
}
