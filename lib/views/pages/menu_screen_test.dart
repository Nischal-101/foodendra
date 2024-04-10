import 'package:flutter/material.dart';

import 'package:foodendra/views/pages/dessert.dart';
import 'package:foodendra/views/pages/home_page.dart';
import 'package:foodendra/widgets/custom/home_button.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

class MenuScreenController extends GetxController {
  final resturantFood = <Map<String, dynamic>>[].obs;
  final resturantBeverage = <Map<String, dynamic>>[].obs;
  final resturantDesserts = <Map<String, dynamic>>[].obs;
  //API calling incomplete
}

class MenuScreen extends StatelessWidget {
  static const routeName = "/menuScreen";

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(
            color: Colors.white), // Change back button color
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const MenuCard(
                image:
                    "https://ajadynasty.com/wp-content/uploads/2022/06/IMG-0521.jpg", // Replace with your image URL
                name: "Food",
                count: "120",
              ),
              const SizedBox(height: 20),
              const MenuCard(
                image:
                    "https://www.beveragedaily.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/beveragedaily.com/article/2020/03/31/beverage-webinar-today-what-drinks-do-consumers-want/10866454-1-eng-GB/Beverage-webinar-today-What-drinks-do-consumers-want.jpg", // Replace with your image URL
                name: "Beverage",
                count: "220",
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Implement navigation logic
                },
                child: InkWell(
                  onTap: () {
                    Get.to(() => const DessertScreen());
                  },
                  child: const MenuCard(
                    image:
                        "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/espresso-chocolate-chilli-cake-with-coffee-cream-b4890a9.jpg?quality=90&resize=556,505", // Replace with your image URL
                    name: "Desserts",
                    count: "135",
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
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
}

class MenuCard extends StatelessWidget {
  final String name;
  final String count;
  final String image;

  const MenuCard({
    super.key,
    required this.name,
    required this.count,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "$count items",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
