// import 'package:flutter/material.dart';
// import 'package:foodendra/views/pages/check_out.dart';
// import 'package:foodendra/views/pages/home_page.dart';
// import 'package:foodendra/widgets/custom/home_button.dart';
// import 'package:get/get.dart';

// class MyOrderView extends StatelessWidget {
//   MyOrderView({super.key});

//   final List<Map<String, dynamic>> itemArr = [
//     {"name": "Beef Burger", "qty": "2", "price": 190.0},
//     {"name": "Classic Burger", "qty": "1", "price": 14.0},
//     {"name": "Cheese Chicken Burger", "qty": "1", "price": 17.0},
//     {"name": "Chicken Legs Basket", "qty": "1", "price": 15.0},
//     {"name": "French Fries Large", "qty": "1", "price": 6.0}
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         icon: const Icon(Icons.arrow_back_ios),
//                       ),
//                       const Text(
//                         "My Cart",
//                         style: TextStyle(
//                             fontSize: 22, fontWeight: FontWeight.w700),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 180,
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.all(18.0),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 120,
//                           width: 130,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(
//                                 color: Colors.black.withOpacity(0.08)),
//                             image: const DecorationImage(
//                               image:
//                                   AssetImage("assets/images/restaurant1.jpg"),
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(height: 50),
//                               const Text(
//                                 "Restaurant Name",
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.w700),
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.star_rate_rounded,
//                                     size: 18,
//                                     color: Colors.deepOrange.shade700,
//                                   ),
//                                   const SizedBox(width: 5),
//                                   const Text(
//                                     "4.9",
//                                     style: TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.location_on,
//                                     size: 16,
//                                     color: Colors.deepOrange.shade700,
//                                   ),
//                                   const SizedBox(width: 5),
//                                   const Text(
//                                     "Pokhara-27, Rithepani",
//                                     style: TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(color: Colors.grey[200]),
//                   child: ListView.separated(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     padding: EdgeInsets.zero,
//                     itemCount: itemArr.length,
//                     separatorBuilder: ((context, index) => Divider(
//                           indent: 25,
//                           endIndent: 25,
//                           color: Colors.grey.withOpacity(0.5),
//                           height: 1,
//                         )),
//                     itemBuilder: ((context, index) {
//                       var cObj = itemArr[index];
//                       return Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 25),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 "${cObj["name"].toString()} x${cObj["qty"].toString()}",
//                                 style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ),
//                             const SizedBox(width: 15),
//                             Text(
//                               "Rs ${cObj["price"].toString()}",
//                               style: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700),
//                             )
//                           ],
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 30),
//                       Divider(color: Colors.grey.withOpacity(0.5), height: 1),
//                       const SizedBox(height: 15),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             "Sub Total",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                           Text(
//                             "Rs 108",
//                             style: TextStyle(
//                                 color: Colors.deepOrange.shade700,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             "Delivery Cost",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                           Text(
//                             "Free",
//                             style: TextStyle(
//                                 color: Colors.deepOrange.shade700,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                       Divider(color: Colors.grey.withOpacity(0.5), height: 1),
//                       const SizedBox(height: 15),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             "Total",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                           Text(
//                             "Rs 108",
//                             style: TextStyle(
//                                 color: Colors.deepOrange.shade700,
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w700),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 25),
//                       SizedBox(
//                         height: 60,
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.deepOrange.shade500),
//                           onPressed: () {
//                             Get.to(Checkout());
//                           },
//                           child: const Text(
//                             'Checkout',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 19,
//                                 fontWeight: FontWeight.w800),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ],
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
// }
