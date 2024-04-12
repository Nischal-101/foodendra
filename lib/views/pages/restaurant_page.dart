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
      required this.restaurantDescription,
      required this.imagePath});

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //         child: SingleChildScrollView(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           IconButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               icon: const Icon(Icons.arrow_back_ios)),
  //           const SizedBox(
  //             height: 20,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 15.0, right: 15),
  //             child: RestaurantDetails(
  //               restaurantName: restaurantName,
  //               description: restaurantDescription,
  //               location: restaurantLocation,
  //               rating: restaurantRating,
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 15, right: 15),
  //             child: Row(
  //               children: [
  //                 Icon(
  //                   Icons.call,
  //                   size: 24,
  //                   color: Colors.deepOrange.shade700,
  //                 ),
  //                 const SizedBox(
  //                   width: 10,
  //                 ),
  //                 const Text("phone number"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),

  //                 const Spacer(),
  //                 Column(
  //                   children: [
  //                     InkWell(
  //                       onTap: () {
  //                         Get.to(() => const MenuScreen());
  //                       },
  //                       child: Container(
  //                         height: 45,
  //                         width: 100,
  //                         decoration: BoxDecoration(
  //                           border:
  //                               Border.all(color: Colors.deepOrange.shade700),
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                         child: Center(
  //                             child: Text(
  //                           "Menu",
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 16,
  //                               color: Colors.orange.shade700),
  //                         )),
  //                       ),
  //                     )
  //                   ],
  //                 ),

  //                 // sized
  //               ],
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           const Padding(
  //             padding: EdgeInsets.only(left: 16, right: 16),
  //             child: Row(
  //               children: [
  //                 Text(
  //                   "From this restaurant",
  //                   style: TextStyle(
  //                       // fontSize: 22,
  //                       color: Color.fromARGB(183, 0, 0, 0),
  //                       fontSize: 22,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //                 Spacer(),
  //               ],
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 15,
  //           ),
  //           SizedBox(
  //             height: 210,
  //             child: ListView(
  //               scrollDirection: Axis.horizontal,
  //               children: const [
  //                 FromThisRestaurant(),
  //                 FromThisRestaurant(),
  //                 FromThisRestaurant(),
  //                 FromThisRestaurant(),
  //               ],
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 25,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 16, right: 16),
  //             child: Row(
  //               children: [
  //                 const Text(
  //                   "Most Popular",
  //                   style: TextStyle(
  //                       color: Color.fromARGB(183, 0, 0, 0),
  //                       fontSize: 22,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //                 const Spacer(),
  //                 InkWell(
  //                   onTap: () {},
  //                   child: const Text(
  //                     "View all",
  //                     style: TextStyle(
  //                         color: Colors.deepOrange,
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.w600),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //           const Padding(
  //             padding: EdgeInsets.only(left: 14, right: 14),
  //             child: Column(
  //               children: [
  //                 SizedBox(
  //                   height: 15,
  //                 ),
  //                 MostPopular(
  //                   foodName: 'Momommmmm',
  //                   price: 'Rs. 200',
  //                 ),
  //                 MostPopular(
  //                   foodName: 'Chomin',
  //                   price: 'Rs. 120',
  //                 ),
  //                 MostPopular(
  //                   foodName: 'Paratha',
  //                   price: 'Rs. 60',
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     )),
  //     floatingActionButton: HomeButton(
  //       onPressed: () {
  //         // Define what should happen when the home button is pressed
  //         print('Home button pressed');
  //         Get.to(Homepage());
  //       },
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // title: const Text(
        //   "Restaurant Name",
        //   style: TextStyle(color: Colors.white),
        // ), // Replace "Restaurant Name" with the actual name of the restaurant
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    Text(
                      "From this restaurant",
                      style: TextStyle(
                        color: Color.fromARGB(183, 0, 0, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "View all",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
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
      height: 200,
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
                Icon(
                  Icons.star_rate_rounded,
                  size: 18,
                  color: Colors.deepOrange.shade700,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(rating,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400)),
                const SizedBox(
                  width: 40,
                ),
                const Icon(
                  Icons.location_on_sharp,
                  color: Colors.deepOrangeAccent,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(location,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.call,
                  size: 24,
                  color: Colors.deepOrange.shade700,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "phone number",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  width: 40,
                ),
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
                          border: Border.all(color: Colors.deepOrange.shade700),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Menu",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.orange.shade700,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
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
    return GestureDetector(
      onTap: () {
        // Add functionality for onTap event
      },
      child: Container(
        height: 210,
        width: 240,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/img1.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black
                      .withOpacity(0.29), // Adjust opacity as needed
                ),
              ),
              const Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Food Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/img3.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.deepOrange.shade700,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
