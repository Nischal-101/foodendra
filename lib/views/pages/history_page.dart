// import 'package:flutter/material.dart';
// import 'package:foodendra/views/pages/home_page.dart';
// import 'package:foodendra/widgets/custom/home_button.dart';
// import 'package:get/get.dart';

// class HistoryPageController extends GetxController {}

// class HistoryPage extends StatelessWidget {
//   const HistoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Order History',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.deepOrangeAccent,
//         iconTheme: const IconThemeData(
//             color: Colors.white), // Change back button color
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           _buildOrderItem(
//             title: 'Pizza',
//             orderedDate: 'April 1, 2024',
//             price: 'Rs 120',
//             imageUrl:
//                 'https://www.foodandwine.com/thmb/Wd4lBRZz3X_8qBr69UOu2m7I2iw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/classic-cheese-pizza-FT-RECIPE0422-31a2c938fc2546c9a07b7011658cfd05.jpg',
//             context: context,
//           ),
//           _buildOrderItem(
//             title: 'Burger',
//             orderedDate: 'March 29, 2024',
//             price: 'Rs 100',
//             imageUrl:
//                 'https://www.foodandwine.com/thmb/DI29Houjc_ccAtFKly0BbVsusHc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/crispy-comte-cheesburgers-FT-RECIPE0921-6166c6552b7148e8a8561f7765ddf20b.jpg',
//             context: context,
//           ),
//           _buildOrderItem(
//             title: 'Salad',
//             orderedDate: 'March 25, 2024',
//             price: 'Rs 200',
//             imageUrl:
//                 'https://cdn.jwplayer.com/v2/media/wGEqBtuf/thumbnails/qSXwlEH3.jpg',
//             context: context,
//           ),
//         ],
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

//   Widget _buildOrderItem({
//     required String title,
//     required String orderedDate,
//     required String price,
//     required String imageUrl,
//     required BuildContext context,
//   }) {
//     return InkWell(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (BuildContext context) {
//             return _buildModalContent(title, orderedDate, price, imageUrl);
//           },
//         );
//       },
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         color: Colors.transparent,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             gradient: const LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 255, 219, 165),
//                 Color.fromARGB(255, 255, 60, 0)
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.network(
//                     imageUrl,
//                     width: 80,
//                     height: 80,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         'Ordered Date: \n$orderedDate',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   price,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildModalContent(
//     String title,
//     String orderedDate,
//     String price,
//     String imageUrl,
//   ) {
//     return Container(
//       width: Get.width,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Image.network(
//               imageUrl,
//               width: 150,
//               height: 150,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Order Date: $orderedDate',
//               style: const TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             Text(
//               'Price: $price',
//               style: const TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             const SizedBox(height: 16),
//             SizedBox(
//               width: Get.width,
//               height: 60,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepOrange),
//                 onPressed: () {
//                   // Handle order again button press
//                 },
//                 child: const Text(
//                   'Order Again',
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodendra/utils/apis.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HistoryPageController extends GetxController {
  final orders = <Map<String, dynamic>>[].obs;

  Future<void> fetchOrderHistory(String userId) async {
    try {
      final response =
          await http.get(Uri.parse('${Api.getOrderHistory}/$userId'));
      log("The ordered history: ${response.body}");
      if (response.statusCode == 200) {
        final List<dynamic> decodedBody = json.decode(response.body);
        log("Decoded body: $decodedBody");
        orders.value = List<Map<String, dynamic>>.from(decodedBody);
      } else {
        throw Exception('Failed to load order history');
      }
    } catch (e) {
      throw Exception('Failed to load order history: $e');
    }
  }
}

class HistoryPage extends StatelessWidget {
  final HistoryPageController controller = Get.put(HistoryPageController());

  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
            final order = controller.orders[index];
            return ListTile(
              title: Text(order['item_name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Quantity: ${order['quantity']}'),
                  Text('Total Price: \$${order['total_price']}'),
                  Text('Order Date: ${order['order_date']}'),
                ],
              ),
              // You can add more customization here as per your UI requirements
            );
          },
        ),
      ),
    );
  }
}
