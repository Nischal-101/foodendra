// // import 'package:flutter/material.dart';
// // import 'package:foodendra/controllers/login_controller.dart';
// // import 'package:foodendra/views/auth/sign_up.dart';
// // import 'package:get/get.dart';

// // class LoginScreen extends StatelessWidget {
// //   LoginScreen({super.key});
// //   // final l = Get.put(LoginScreenController());
// //   final l = Get.put(LoginController());

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // appBar: AppBar(title: Text('Login')),
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           child: Padding(
// //             padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               children: [
// //                 const SizedBox(
// //                   height: 120,
// //                 ),
// //                 Container(
// //                   alignment: Alignment.center,
// //                   child: const Text(
// //                     "Login",
// //                     style: TextStyle(
// //                         color: Colors.black,
// //                         fontSize: 30,
// //                         fontWeight: FontWeight.w800),
// //                   ),
// //                 ),
// //                 const Text(
// //                   "Add your details to login",
// //                   style: TextStyle(
// //                       color: Color.fromARGB(255, 125, 125, 125),
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.w500),
// //                 ),
// //                 const SizedBox(
// //                   height: 25,
// //                 ),
// //                 TextField(
// //                     controller: l.emailController,
// //                     decoration: InputDecoration(
// //                       hintText: 'Your Email',
// //                       border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(
// //                             25.0), // Set border radius here
// //                       ),
// //                     )),
// //                 const SizedBox(
// //                   height: 25,
// //                 ),
// //                 TextField(
// //                     controller: l.passwordController,
// //                     decoration: InputDecoration(
// //                       hintText: 'Password',
// //                       border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(
// //                             25.0), // Set border radius here
// //                       ),
// //                     )),
// //                 const SizedBox(
// //                   height: 25,
// //                 ),
// //                 SizedBox(
// //                   height: 60,
// //                   width: Get.width,
// //                   child: ElevatedButton(
// //                     onPressed: () {
// //                       l.onSubmit();
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: const Color.fromARGB(255, 255, 90, 45),
// //                       // side: const BorderSide(color: Colors.black),
// //                       shape: const RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.all(Radius.circular(25)),
// //                       ),
// //                     ),
// //                     child: const Text('Login',
// //                         style: TextStyle(color: Colors.white, fontSize: 17)),
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 25,
// //                 ),
// //                 InkWell(
// //                   onTap: () {},
// //                   child: const Text(
// //                     "Forget your password?",
// //                     style: TextStyle(
// //                         color: Color.fromARGB(255, 82, 82, 82),
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w400),
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 25,
// //                 ),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     const Text(
// //                       "Didn't have an account?",
// //                       style: TextStyle(
// //                           color: Color.fromARGB(255, 82, 82, 82),
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.w400),
// //                     ),
// //                     const SizedBox(
// //                       width: 2,
// //                     ),
// //                     // TextButton(onPressed: () {}, child: Text("Sign up")),
// //                     InkWell(
// //                         onTap: () {
// //                           Get.to(SignupScreen());
// //                         },
// //                         child: const Text(
// //                           "Sign up",
// //                           style: TextStyle(
// //                               color: Color.fromARGB(255, 255, 90, 45),
// //                               fontSize: 16,
// //                               fontWeight: FontWeight.bold),
// //                         ))
// //                   ],
// //                 )
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});

//   final l = Get.put(LoginController()); // Reintegrate the controller

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 80),
//                 const Text(
//                   "Welcome Back!",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 36,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   "Please sign in to continue",
//                   style: TextStyle(
//                     color: Colors.grey.shade600,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 _buildInputField(
//                   hintText: 'Your Email',
//                   icon: Icons.email,
//                   controller: l.emailController,
//                 ),
//                 const SizedBox(height: 20),
//                 _buildInputField(
//                   hintText: 'Password',
//                   icon: Icons.lock,
//                   obscureText: true,
//                   controller: l.passwordController,
//                 ),
//                 const SizedBox(height: 40),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 60,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       l.onSubmit();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.deepOrangeAccent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     child: const Text(
//                       'Login',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 InkWell(
//                   onTap: () {
//                     // Add your forgot password logic here
//                   },
//                   child: const Text(
//                     "Forgot your password?",
//                     style: TextStyle(
//                       color: Colors.deepOrangeAccent,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account?",
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     const SizedBox(width: 5),
//                     InkWell(
//                       onTap: () {
//                         // Add your sign-up navigation logic here
//                       },
//                       child: const Text(
//                         "Sign up",
//                         style: TextStyle(
//                           color: Colors.deepOrangeAccent,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField(
//       {required String hintText,
//       required IconData icon,
//       bool obscureText = false,
//       required TextEditingController controller}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: TextFormField(
//         obscureText: obscureText,
//         controller: controller,
//         style: const TextStyle(fontSize: 16),
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: TextStyle(color: Colors.grey.shade400),
//           border: InputBorder.none,
//           prefixIcon: Icon(
//             icon,
//             color: Colors.grey.shade600,
//           ),
//         ),
//       ),
//     );
//   }
// }
