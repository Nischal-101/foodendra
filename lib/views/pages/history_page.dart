import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodendra/utils/apis.dart';
import 'package:foodendra/utils/storage_key.dart';
import 'package:foodendra/views/pages/home_page.dart';
import 'package:foodendra/widgets/custom/home_button.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HistoryPageController extends GetxController {
  final orders = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchOrderHistory();
    super.onInit();
  }

  Future<void> fetchOrderHistory() async {
    final user = StorageHelper.getUser();
    final userId = user?.userId;
    try {
      final response = await http.post(
        Uri.parse(Api.getOrderHistory),
        body: {
          'user_id': userId.toString(),
        },
      );
      print("The logged in user: $userId"); // Check if user is not null
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
  HistoryPage({super.key});

  final HistoryPageController controller = Get.put(HistoryPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order History',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        iconTheme: const IconThemeData(
            color: Colors.white), // Change back button color
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
            final order = controller.orders[index];

            return _buildOrderItem(
              title: order['item_name'],
              orderedDate: order['order_date'],
              price: order['total_price'],
              imageUrl: '${Api.baseUrl}/${order['food_image']}',
              context: context,
            );
          },
        ),
      ),
      floatingActionButton: HomeButton(
        onPressed: () {
          // Define what should happen when the home button is pressed
          print('Home button pressed');
          Get.to(Homepage());
        },
      ),
    );
  }

  Widget _buildOrderItem({
    required String title,
    required String orderedDate,
    required String price,
    required String imageUrl,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return _buildModalContent(title, orderedDate, price, imageUrl);
          },
        );
      },
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.25)),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                // gradient: const LinearGradient(
                //   colors: [
                //     Color.fromARGB(255, 255, 219, 165),
                //     Color.fromARGB(255, 255, 60, 0)
                //   ],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    spreadRadius: 3,
                    blurRadius: 9,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Ordered Date: \n$orderedDate',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Rs $price",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModalContent(
    String title,
    String orderedDate,
    String price,
    String imageUrl,
  ) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20)),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            Image.network(
              imageUrl,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(
                  width: 45,
                ),
                const Text(
                  'Order Date: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  orderedDate,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Price: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  price,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                  width: Get.width / 2.2,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 97, 237, 102)),
                    onPressed: () {
                      // Handle order again button press
                    },
                    child: const Text(
                      'Order Again',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: Get.width / 2.2,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 14, 10)),
                    onPressed: () {
                      // Handle order again button press
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
