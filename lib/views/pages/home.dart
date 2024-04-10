// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Container(
              color: Colors.red,
            )),
            const ListTile(
              title: Text("page 1"),
            ),
            const Divider(
              thickness: 2,
            ),
            const ListTile(
              title: Text("page 2"),
            ),
            const Divider(
              thickness: 2,
            ),
            const ListTile(
              title: Text("page 3"),
            ),
            const Divider(
              thickness: 2,
            ),
            const ListTile(
              title: Text("page 4"),
            ),
            const Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Let's eat!",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () =>
                            _scafoldKey.currentState?.openEndDrawer(),
                        icon: const Icon(Icons.menu))
                  ],
                ),
                // const Text(
                //   "Tasty food",
                //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                // ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildSliderItemText("Momo"),
                      _buildSliderItemText("Chowmin"),
                      _buildSliderItemText("Pizza"),
                      _buildSliderItemText("Burger"),
                      _buildSliderItemText("Khaja set"),
                      _buildSliderItemText("Coke"),
                      _buildSliderItemText("Tea")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      RestaurantCard(
                        restaurant: '',
                        rating: '',
                        description: '',
                        image: '',
                      ),
                      RestaurantCard(
                        restaurant: '',
                        rating: '',
                        description: '',
                        image: '',
                      ),
                      RestaurantCard(
                        restaurant: '',
                        rating: '',
                        description: '',
                        image: '',
                      ),
                      // RestaurantCard(),
                      // RestaurantCard()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSliderItemText(String text) {
    return InkWell(
      onTap: () {
        // Do something when the item is tapped
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          // width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // border: Border.all(color: Colors.black)
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String restaurant;
  final String rating;
  final String description;
  final String image;

  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.rating,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 480,
      // color: Colors.black38,
      child: Stack(
        children: [
          Positioned(
            left: 35,
            top: 50,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 280,
                height: 380,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 107, 73)
                        .withOpacity(.32),
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              height: 205,
              width: 185,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(235, 255, 48, 1).withOpacity(.6)),
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              height: 205,
              width: 185,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue),
            ),
          ),
          const Positioned(
            left: 223,
            top: 120,
            child: Text(
              "Rating",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Positioned(
            left: 70,
            top: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Restaurant 1",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 210,
                  child: Text(
                      maxLines: 4,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis libero ut diam ultricies, id dictum tortor vehicula. Proin sit amet odio eu justo fermentum accumsan. Integer ullamcorper neque id felis laoreet, vel consequat justo vestibulum."),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
