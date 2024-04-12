// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:foodendra/controllers/cart_list_checkout_controller.dart';
// import 'package:foodendra/controllers/esewa.dart';
// import 'package:foodendra/views/pages/home_page.dart';
// import 'package:get/get.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';

// import '../../widgets/custom/home_button.dart';

// class Checkout extends StatelessWidget {
//   Checkout({super.key});

//   final c = Get.put(CartItemsViewController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'My Cart',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.deepOrange,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20),
//             child: SafeArea(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // const SizedBox(height: 20),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 15),
//                     child: Text(
//                       "Delivery Address",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         hintText: 'Enter your address',
//                         contentPadding: const EdgeInsets.symmetric(
//                             vertical: 12, horizontal: 16),
//                         fillColor: Colors.grey[200],
//                         filled: true,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Divider(
//                     thickness: 12,
//                     color: Colors.black.withOpacity(0.04),
//                   ),
//                   const SizedBox(height: 20),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 15),
//                     child: Text(
//                       "Payment method",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 16.0, right: 16),
//                     child: Column(
//                       children: [
//                         _buildPaymentMethod(
//                           image:
//                               const AssetImage("assets/images/Esewa_logo.png"),
//                           label: "Esewa",
//                           onTap: () {
//                             Esewa e = Esewa();
//                             e.pay();
//                           },
//                         ),
//                         const SizedBox(height: 8),
//                         _buildPaymentMethod(
//                           image: const AssetImage("assets/images/logo1.png"),
//                           label: "Khalti",
//                           onTap: () {
//                             KhaltiScope.of(context).pay(
//                               config: PaymentConfig(
//                                 amount: 1000,
//                                 productIdentity: "productIdentity",
//                                 productName: "productName",
//                               ),
//                               preferences: [
//                                 PaymentPreference.khalti,
//                               ],
//                               onSuccess: (success) async {
//                                 log("Success");
//                                 await c.checkout(context, restaurantId,);
//                                 c.fetchCartItems();
//                               },
//                               onFailure: (fa) {
//                                 log("Failed");
//                               },
//                               onCancel: () {
//                                 log("canceled");
//                               },
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 8),
//                         _buildPaymentMethod(
//                           label: "Cash on delivery",
//                           onTap: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: HomeButton(
//         onPressed: () {
//           // Define what should happen when the home button is pressed
//           print('Home button pressed');
//           Get.to(Homepage());
//         },
//       ),
//     );
//   }

//   Widget _buildPaymentMethod({
//     required String label,
//     ImageProvider? image,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 65,
//         width: Get.width,
//         decoration: BoxDecoration(
//           border: Border.all(color: const Color.fromARGB(255, 255, 113, 24)),
//           borderRadius: BorderRadius.circular(5),
//           color: Colors.white,
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           children: [
//             if (image != null) ...[
//               Image(image: image, height: 30),
//               const SizedBox(width: 20),
//             ],
//             Text(
//               label,
//               style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
