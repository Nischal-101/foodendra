import 'package:flutter/material.dart';
import 'package:foodendra/views/pages/restaurant_page.dart';
import 'package:get/get.dart';

class RecommendedWidget extends StatelessWidget {
  final String imagePath;
  final String restaurantName;
  final String restaurantLocation;
  final String restaurantRating;
  final String restaurantDecription;

  const RecommendedWidget({
    super.key,
    required this.restaurantName,
    required this.restaurantLocation,
    required this.restaurantRating,
    required this.imagePath,
    required this.restaurantDecription,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => RestaurantHomePage(
            restaurantName: restaurantName,
            restaurantRating: restaurantRating,
            restaurantLocation: restaurantLocation,
            restaurantDescription: restaurantDecription,
            imagePath: imagePath,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    // Use network image if imagePath is not empty, otherwise use asset image
                    image: imagePath.isNotEmpty
                        ? NetworkImage(imagePath)
                        : const AssetImage("assets/images/res1.jpg")
                            as ImageProvider,
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              restaurantName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 13,
                  color: Colors.yellow[600],
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  restaurantRating,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.location_on,
                  size: 13,
                  color: Colors.blue[600],
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  restaurantLocation,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w300),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
