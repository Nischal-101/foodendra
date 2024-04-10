import 'package:flutter/material.dart';
import 'package:foodendra/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final c = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image(
          //   // image: AssetImage(ImagePath.logo),
          // ),
          SizedBox(
            height: 50,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.black,
            // valueColor: AlwaysStoppedAnimation(tertiaryColor),
          ),
        ],
      ),
    );
  }
}
