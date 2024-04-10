import 'package:flutter/material.dart';
import 'package:foodendra/views/pages/home_page.dart';
// import 'package:foodendra/views/pages/menu_page.dart';
import 'package:foodendra/views/pages/menu_screen_test.dart';
import 'package:foodendra/widgets/custom/home_button.dart';
import 'package:get/get.dart';

class RestaurantHomePage extends StatelessWidget {
  final String imagePath;
  final String restaurantName;
  final String restaurantRating;
  final String restaurantDescription;
  final String restaurantLocation;

  const RestaurantHomePage(
      {super.key,
      required this.restaurantName,
      required this.restaurantRating,
      required this.restaurantLocation,
      required this.restaurantDescription, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: RestaurantDetails(
                restaurantName: restaurantName,
                description: restaurantDescription,
                location: restaurantLocation,
                rating: restaurantRating,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.attach_money_sharp,
                    size: 24,
                    color: Colors.deepOrange.shade700,
                  ),
                  const Text("Free \nDelivery"),
                  const SizedBox(
                    width: 40,
                  ),
                  Icon(
                    Icons.av_timer_sharp,
                    size: 24,
                    color: Colors.deepOrange.shade700,
                  ),
                  const Text("25 Min"),
                  const Spacer(),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => const MenuScreen());
                        },
                        child: Container(
                          height: 45,
                          width: 100,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.deepOrange.shade700),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            "Menu",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.orange.shade700),
                          )),
                        ),
                      )
                    ],
                  ),

                  // sized
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Text(
                    "From this restaurant",
                    style: TextStyle(
                        // fontSize: 22,
                        color: Color.fromARGB(183, 0, 0, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 210,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  FromThisRestaurant(),
                  FromThisRestaurant(),
                  FromThisRestaurant(),
                  FromThisRestaurant(),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  const Text(
                    "Most Popular",
                    style: TextStyle(
                        color: Color.fromARGB(183, 0, 0, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "View all",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 14, right: 14),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  MostPopular(
                    foodName: 'Momommmmm',
                    price: 'Rs. 200',
                  ),
                  MostPopular(
                    foodName: 'Chomin',
                    price: 'Rs. 120',
                  ),
                  MostPopular(
                    foodName: 'Paratha',
                    price: 'Rs. 60',
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
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

class RestaurantDetails extends StatelessWidget {
  final String restaurantName;
  final String rating;
  final String location;
  final String description;
  const RestaurantDetails({
    super.key,
    required this.restaurantName,
    required this.rating,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: Get.width,
      decoration: const BoxDecoration(
          // border: Border.all(color: Colors.black),
          // color: Colors.amber
          ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurantName,
              style: const TextStyle(
                  color: Color.fromARGB(183, 0, 0, 0),
                  fontSize: 28,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              description,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(location,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(
                  width: 40,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  size: 18,
                  color: Colors.deepOrange.shade700,
                ),
                Text(rating,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FromThisRestaurant extends StatelessWidget {
  const FromThisRestaurant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 210,
          width: 240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black.withOpacity(0.06))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/images/img1.jpg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.black
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  "Food Name",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const Text(
                  "Price",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}

class MostPopular extends StatelessWidget {
  final String foodName;
  final String price;

  const MostPopular({
    super.key,
    required this.foodName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                color: Colors.black.withOpacity(0.03),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            height: 90,
            width: Get.width,
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 90,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/img3.jpg"),
                          fit: BoxFit.fill),
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                ),
                const Spacer(),
                Container(
                  height: Get.height,
                  width: 255,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.amber
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        foodName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // Spacer(),
                            Text(price,
                                style: TextStyle(
                                    color: Colors.deepOrange.shade700,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
