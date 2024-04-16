import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:foodendra/controllers/core_controller.dart';
import 'package:foodendra/controllers/home_controller.dart';
import 'package:foodendra/views/pages/all_recommended_resturant.dart';
import 'package:foodendra/views/pages/cart_list.dart';
import 'package:foodendra/views/pages/history_page.dart';
import 'package:foodendra/views/pages/list_of_menu_items.dart';
import 'package:foodendra/widgets/custom/drawer_widget.dart';
import 'package:foodendra/widgets/custom/home_button.dart';
import 'package:foodendra/widgets/custom/recommended_restaurant.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatelessWidget {
  final a = Get.put(HomepageController());

  final sliderImage = [
    const AssetImage("assets/images/banner1.jpg"),
    const AssetImage("assets/images/banner2.jpg"),
    const AssetImage("assets/images/banner3.jpg"),
  ];

  final ValueNotifier<int> sliderCurrentIndex = ValueNotifier<int>(0);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Homepage({super.key});

  final c = Get.put(CoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 17.0),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    const Text(
                      "Good morning",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.sunny,
                      color: Colors.yellow[700],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Get.to(() => CartItemsView());
                      },
                      icon: const Icon(Icons.shopping_cart,
                          color: Colors.deepOrangeAccent),
                    ),
                    IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                      icon: const Icon(Icons.menu,
                          size: 30, color: Colors.deepOrangeAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.deepOrange),
                      hintText: "What are you craving for",
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onTap: () {
                      Get.to(MenuItemsList());
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  height: 250,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    sliderCurrentIndex.value = index;
                  },
                ),
                itemCount: sliderImage.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: sliderImage[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: ValueListenableBuilder<int>(
                  valueListenable: sliderCurrentIndex,
                  builder: (context, value, child) {
                    return AnimatedSmoothIndicator(
                      activeIndex: value,
                      count: sliderImage.length,
                      effect: WormEffect(
                        dotHeight: 5,
                        dotWidth: 5,
                        spacing: 4,
                        dotColor: Colors.grey.shade200,
                        activeDotColor: Colors.grey.shade900,
                        paintStyle: PaintingStyle.fill,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Text(
                      "Recommended",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(AllRecommendedResturantPage());
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepOrange),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Obx(() {
                // Check if data is not empty
                if (a.recommendedRestaurants.isNotEmpty) {
                  // Use data from the API for the first restaurant
                  final firstRestaurant = a.recommendedRestaurants.first;
                  return RecommendedWidget(
                    restaurantName: firstRestaurant.restaurantName ?? '',
                    restaurantLocation: firstRestaurant.restaurantAddress ?? '',
                    restaurantRating: firstRestaurant.avgRating.toString(),
                    imagePath: firstRestaurant.restaurantImage ?? '',
                    restaurantDecription:
                        firstRestaurant.restaurantDescription ??
                            'No description for this restaurant.',
                  );

                  // return RecommendedWidget(
                  //   restaurantName: firstRestaurant['restaurant_name'],
                  //   // restaurantLocation: '',
                  //   restaurantLocation: firstRestaurant[
                  //       'restaurant_address'], // Set location here
                  //   restaurantRating: firstRestaurant['avg_rating'].toString(),
                  //   imagePath: firstRestaurant['restaurant_image'] ?? '',
                  //   restaurantDecription: firstRestaurant[
                  //           'restaurant_description'] ??
                  //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', // Set image path here
                  // );
                } else {
                  // Show a loading indicator or placeholder if data is empty
                  return const Center(child: CircularProgressIndicator());
                }
              }),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Text(
                      "Order again",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(HistoryPage());
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepOrange),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const OrderAgainWidget(
                foodName: 'Chicken cheese Burger',
                restaurantName: 'Loken Khaja Ghar',
                location: 'Awashnagar',
                rating: '4.5',
              ),
              const OrderAgainWidget(
                foodName: 'Momo',
                restaurantName: 'Loken Khaja Ghar',
                location: 'Awashnagar',
                rating: '4.5',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Text(
                      "Most Popular",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "View all",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepOrange),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    MostPopularWidget(),
                    MostPopularWidget(),
                    MostPopularWidget()
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      endDrawer: DrawerWidget(c: c),

      // endDrawer: DrawerWidget(c: c),
      floatingActionButton: HomeButton(
        onPressed: () {
          // Define what should happen when the home button is pressed
          // print('Home button pressed');
          Get.to(Homepage());
        },
      ),
    );
  }
}

class MostPopularWidget extends StatelessWidget {
  const MostPopularWidget({super.key});

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
                  "Restaurant Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const Text(
                  "location",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
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

class OrderAgainWidget extends StatelessWidget {
  final String foodName;
  final String restaurantName;
  final String location;
  final String rating;
  const OrderAgainWidget({
    super.key,
    required this.foodName,
    required this.restaurantName,
    required this.location,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
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
                            image: AssetImage("assets/images/burger.jpg"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const Spacer(),
                  Container(
                    height: Get.height,
                    width: 255,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodName,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                            // height: 5,
                            ),
                        Row(
                          children: [
                            Text(restaurantName,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300)),
                          ],
                        ),
                        Text(rating,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
