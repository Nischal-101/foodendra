// import 'dart:developer';

// import 'package:flutter/widgets.dart';
// import 'package:foodendra/controllers/core_controller.dart';
// import 'package:foodendra/views/auth/home_page.dart';
// import 'package:foodendra/views/auth/sign_up.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
// import 'dart:convert';

// import '../repo/login_repo.dart';
// import '../utils/storage_key.dart';

// class LoginScreenController extends GetxController {
//   final formKey = GlobalKey<FormState>();

//   RxBool passwordObscure = true.obs;

//   final passwordController = TextEditingController();

//   final emailController = TextEditingController();
//   final loading = SimpleFontelicoProgressDialog(
//       context: Get.context!, barrierDimisable: false);
//   RxBool isChecked = false.obs;
//   void onEyeCLick() {
//     passwordObscure.value = !passwordObscure.value;
//   }

//   void onSubmit() async {
//     if (formKey.currentState!.validate()) {
//       loading.show(message: "Please wait..");
//       await LoginRepo.login(
//           email: emailController.text,
//           password: passwordController.text,
//           onSuccess: ((user, token) async {
//             loading.hide();
//             final box = GetStorage();
//             await box.write(StorageKeys.USER, json.encode(user.toJson()));
//             await box.write(StorageKeys.ACCESS_TOKEN, token);
//             Get.find<CoreController>().loadCurrentUser();
//             Get.offAll(() => Homepage());
//             log("Successsss");
//             // CustomSnackBar.success(
//             //     title: "Login", message: "Login Successfully");
//           }),
//           onError: (message) {
//             loading.hide();
//             log("Unsuccesssss");
//             // CustomSnackBar.error(title: "Login", message: message);
//           });
//     }
//   }
// }
