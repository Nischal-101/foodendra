import 'package:flutter/material.dart';
import 'package:foodendra/controllers/signup_controller.dart';
import 'package:foodendra/views/auth/login_screen.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final s = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const Text(
                  "Add your details to signup",
                  style: TextStyle(
                      color: Color.fromARGB(255, 125, 125, 125),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 55,
                  child: TextField(
                      controller: s.usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              25.0), // Set border radius here
                        ),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 55,
                  child: TextField(
                      controller: s.emailController,
                      decoration: InputDecoration(
                        hintText: 'Your Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              25.0), // Set border radius here
                        ),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 55,
                  child: TextField(
                      controller: s.addressController,
                      decoration: InputDecoration(
                        hintText: 'Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              25.0), // Set border radius here
                        ),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 55,
                  child: TextField(
                      controller: s.phoneNumberController,
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              25.0), // Set border radius here
                        ),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 55,
                  child: TextField(
                      controller: s.passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              25.0), // Set border radius here
                        ),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 55,
                  child: TextField(
                      controller: s.confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Confirm password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              25.0), // Set border radius here
                        ),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 60,
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () {
                      s.onSubmit();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 90, 45),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                    child: const Text('Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 82, 82, 82),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                        child: const Text(
                          "Login",
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
