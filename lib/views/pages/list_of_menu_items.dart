import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:foodendra/controllers/list_of_menu_items_controller.dart';
import 'package:foodendra/views/pages/home_page.dart';
import 'package:foodendra/views/pages/item_detail_view.dart';
import 'package:foodendra/widgets/custom/home_button.dart';
import 'package:get/get.dart';

class MenuItemsList extends StatelessWidget {
  MenuItemsList({super.key});

  final c = Get.put(MenuItemsListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu Item List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(
            color: Colors.white), // Change back button color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search, color: Colors.grey),
                    onPressed: () {
                      c.searchMenuItems(c.searchController.text);
                      c.focusNode.unfocus(); // Unfocus the TextField
                    },
                  ),
                  hintText: "What are you craving for",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (value) {
                  c.searchMenuItems(value);
                },
              ),
            ),
            const SizedBox(height: 15),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sort by:   ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.deepOrangeAccent
                      ),
                      height: 35,
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.deepOrangeAccent),
                        onPressed: () {
                          c.sortMenuItemsByLowPrice();
                        },
                        child: const Text(
                          'Low Price',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    // InkWell(
                    //   onTap: () {
                    //     c.sortMenuItemsByLowPrice();
                    //   },
                    //   child: Container(
                    //     height: 35,
                    //     width: 120,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         border: Border.all(color: Colors.deepOrangeAccent)),
                    //     child: const Center(
                    //         child: Text(
                    //       'Low price',
                    //       style: TextStyle(fontWeight: FontWeight.bold),
                    //     )),
                    //   ),
                    // ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.deepOrangeAccent
                      ),
                      height: 35,
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.deepOrangeAccent),
                        onPressed: () {
                          c.sortMenuItemsByHighPrice();
                        },
                        child: const Text(
                          'High Price',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
            Obx(() {
              if (c.searchResults.isEmpty) {
                return const Text('No results found');
              } else {
                return SizedBox(
                  height: Get.height,
                  child: ListView.builder(
                    itemCount: c.searchResults.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        final menuitem = c.searchResults[index];
                        return InkWell(
                          onTap: () {
                            //Next navigating for food details page
                            Get.to(ItemDetailsView(
                              name: menuitem['name'] ?? '',
                              price: menuitem['price']?.toString() ?? '',
                              description: menuitem['description'] ?? '',
                              itemId: menuitem['item_id']?.toString() ?? '',
                              restaurantId:
                                  menuitem['restaurant_id']?.toString() ?? '',
                              foodImagePath:
                                  menuitem['food_image']?.toString() ?? '',
                            ));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
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
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                menuitem['food_image']))),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        menuitem['name'] ?? '',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Price: Rs ${menuitem['price'] ?? ''}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      Text(
                                        'From ${menuitem['restaurant_name'] ?? ''}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
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
