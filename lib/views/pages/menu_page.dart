import 'package:flutter/material.dart';
import 'package:foodendra/views/pages/item_detail_view.dart';
import 'package:get/get.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Menu",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: orderedFoodItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MenuItemCard(foodItem: orderedFoodItems[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final String foodItem;

  const MenuItemCard({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ItemDetailsView(
          name: '',
          price: '',
          description: '',
          itemId: '',
          restaurantId: '',
          foodImagePath: '',
        ));
      },
      child: Card(
        color: const Color.fromARGB(
            255, 255, 115, 45), // Change the color to a soft shade of orange
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                // child: Image.asset(
                //   'assets/images/$foodItem.jpg', // Assuming image assets are named as food item names
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  foodItem,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> orderedFoodItems = [
  'Pizza',
  'Burger',
  'Sushi',
  'Salad',
  'Pasta',
  'Taco',
  'Sandwich',
  'Curry',
  'Ramen',
  'Steak'
];
