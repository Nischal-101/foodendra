import 'package:flutter/material.dart';
import 'package:foodendra/views/pages/home_page.dart';
import 'package:foodendra/widgets/custom/home_button.dart';
import 'package:get/get.dart';

class DessertScreen extends StatelessWidget {
  static const routeName = '/dessertScreen';

  const DessertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Desserts',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(
            color: Colors.white), // Change back button color
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          dessertCard(
            imageUrl:
                'https://images.immediate.co.uk/production/volatile/sites/30/2022/08/French-apple-tart-ffb6034.jpg?resize=768,574',
            name: 'French Apple Pie',
            shop: 'By BBQ Joint',
            rating: '4.9',
          ),
          const SizedBox(height: 10),
          dessertCard(
            imageUrl: 'https://i.ytimg.com/vi/RXBJhNpPBO4/sddefault.jpg',
            name: 'Dark Chocolate Cake',
            shop: 'Cakes by BBQ Joint',
            rating: '4.7',
          ),
          const SizedBox(height: 10),
          dessertCard(
            imageUrl:
                'https://media-cdn.tripadvisor.com/media/photo-s/10/17/a8/b6/photo1jpg.jpg',
            name: 'Street Shake',
            shop: 'By BBQ Joint',
            rating: '4.9',
          ),
          const SizedBox(height: 10),
          dessertCard(
            imageUrl:
                'https://www.browneyedbaker.com/wp-content/uploads/2010/03/chewy-brownies-18-550.jpg',
            name: 'Fudgy Chewy Brownies',
            shop: 'By BBQ Joint',
            rating: '4.9',
          ),
        ],
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

  Widget dessertCard({
    required String imageUrl,
    required String name,
    required String rating,
    required String shop,
  }) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          dessertDetails(imageUrl, name, rating, shop),
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        );
      },
      child: DessertCard(
        imageUrl: imageUrl,
        name: name,
        shop: shop,
        rating: rating,
      ),
    );
  }

  Widget dessertDetails(
    String imageUrl,
    String name,
    String rating,
    String shop,
  ) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.orange,
                size: 20,
              ),
              const SizedBox(width: 5),
              Text(
                rating,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Shop: $shop',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
              onPressed: () {
                // Add to cart functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange, // Button color
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DessertCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String rating;
  final String shop;

  const DessertCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.2),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        rating,
                        style: const TextStyle(color: Colors.orange),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        shop,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
