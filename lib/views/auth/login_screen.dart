import 'package:flutter/material.dart';
import 'package:foodendra/controllers/login_controller.dart';
import 'package:foodendra/views/auth/sign_up.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  // final l = Get.put(LoginScreenController());
  final l = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Login')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const Text(
                  "Add your details to login",
                  style: TextStyle(
                      color: Color.fromARGB(255, 125, 125, 125),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                    controller: l.emailController,
                    decoration: InputDecoration(
                      hintText: 'Your Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            25.0), // Set border radius here
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                    controller: l.passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            25.0), // Set border radius here
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 60,
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () {
                      l.onSubmit();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 90, 45),
                      // side: const BorderSide(color: Colors.black),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                    child: const Text('Login',
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Forget your password?",
                    style: TextStyle(
                        color: Color.fromARGB(255, 82, 82, 82),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't have an account?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 82, 82, 82),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    // TextButton(onPressed: () {}, child: Text("Sign up")),
                    InkWell(
                        onTap: () {
                          Get.to(SignupScreen());
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 90, 45),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
