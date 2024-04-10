import 'dart:async';

import 'package:foodendra/controllers/core_controller.dart';
import 'package:foodendra/views/pages/home_page.dart';
import 'package:foodendra/views/auth/login_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final c = Get.put(CoreController());
  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () async {
      if (c.isUserLoggedIn()) {
        Get.offAll(Homepage());
      } else {
        Get.offAll(LoginScreen());
      }
    });
    super.onInit();
  }
}
