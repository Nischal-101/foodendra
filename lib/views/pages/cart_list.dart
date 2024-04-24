import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodendra/controllers/cart_list_checkout_controller.dart';
import 'package:foodendra/models/restaurant.dart';
import 'package:foodendra/views/pages/check_out.dart';
import 'package:foodendra/views/pages/home_page.dart';
import 'package:foodendra/views/pages/list_of_menu_items.dart';
import 'package:foodendra/widgets/custom/home_button.dart';
import 'package:get/get.dart';

class CartItemsView extends StatelessWidget {
  CartItemsView({
    super.key,
  });

  final c = Get.put(CartItemsViewController());

  @override
  Widget build(BuildContext context) {
    Get.find<CartItemsViewController>().fetchCartItems();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Obx(() {
        if (c.restaurantsWithMenuItems.isEmpty ||
            c.restaurantsWithMenuItems.toString().contains(
                "No restaurant data with menu items found in the cart for the user")) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Your cart is empty!',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => MenuItemsList());
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.deepOrange),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Text(
                        "Explore Menu",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Obx(
            () => ListView.builder(
              itemCount: c.restaurantsWithMenuItems.length,
              itemBuilder: (context, index) {
                final restaurantId =
                    c.restaurantsWithMenuItems.keys.elementAt(index);
                final restaurantData = c.restaurantsWithMenuItems[restaurantId];

                if (restaurantData == null || restaurantData.isEmpty) {
                  return const SizedBox.shrink(); // Return an empty widget
                }

                final restaurantName = restaurantData['restaurant_name'];
                final menuItems = restaurantData['menu_items'];

                if (menuItems == null || menuItems.isEmpty) {
                  return const SizedBox.shrink(); // Return an empty widget
                }

                double subtotal = 0;
                for (var menuItem in menuItems) {
                  final total = menuItem['total'];

                  if (menuItem['total'] is String) {
                    subtotal += (double.parse(total));
                    // log('Helloooo');
                  } else {
                    // Handle the case where 'total' or 'quantity' is not a numeric type
                    log('Warning: Invalid total or quantity for menu item: $menuItem');
                  }
                  subtotal = double.parse(subtotal.toStringAsFixed(2));
                }

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                restaurantName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Handle close button action
                                  c.removeCart(context, restaurantId);
                                  Get.find<CartItemsViewController>()
                                      .fetchCartItems();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          height: 0,
                          thickness: 0.5,
                        ),
                        Column(
                          children: menuItems.map<Widget>((menuItem) {
                            return ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    '${menuItem['name']}',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    ' x${menuItem['quantity']}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                menuItem['description'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Rs ${menuItem['total']}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      c.removeSingleCartItem(
                                        menuItem['item_id'].toString(),
                                        restaurantId,
                                      );
                                      // Handle delete action
                                    },
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: () async {
                              // Handle button press action
                              await c.checkout(
                                context,
                                restaurantId,
                              );

                              // Get.to(() => Checkout());
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: Row(
                                children: [
                                  Text(
                                    'Sub total:\nRs $subtotal', // Display subtotal here
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'Continue',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                );

                // return Container(
                //   margin:
                //       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(16),
                //     border: Border.all(color: Colors.grey.shade300, width: 2),
                //   ),
                //   child: Card(
                //     elevation: 0,
                //     color: Colors.transparent,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(
                //               left: 16, right: 23, top: 16, bottom: 16),
                //           child: Row(
                //             children: [
                //               Text(
                //                 restaurantName,
                //                 style: const TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 20,
                //                 ),
                //               ),
                //               const Spacer(),
                //               IconButton(
                //                 onPressed: () {
                //                   // c.removeCart(context);
                //                   // c.fetchCartItems(); // Call the removeCart method with the context
                //                 },
                //                 icon: const Icon(
                //                   Icons.close,
                //                   color: Colors.deepOrangeAccent,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         Column(
                //           children: menuItems.map<Widget>((menuItem) {
                //             return ListTile(
                //               title: Row(
                //                 children: [
                //                   Text(
                //                     maxLines: 3,
                //                     '${menuItem['name']} ',
                //                     style: const TextStyle(
                //                       fontSize: 14,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                   Text(
                //                     'x${menuItem['quantity']}',
                //                     style: const TextStyle(
                //                       fontSize: 12,
                //                       color: Colors.grey,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               subtitle: Text(
                //                 menuItem['description'],
                //                 maxLines: 5,
                //               ),
                //               trailing: Row(
                //                 mainAxisSize: MainAxisSize.min,
                //                 children: [
                //                   Text(
                //                     'Rs ${menuItem['total']}',
                //                     style: const TextStyle(fontSize: 15),
                //                   ),
                //                   IconButton(
                //                     icon: Icon(
                //                       Icons.delete_outlined,
                //                       size: 30,
                //                       color: Colors.red[500],
                //                     ),
                //                     onPressed: () {
                //                       c.removeSingleCartItem(
                //                         menuItem['item_id'].toString(),
                //                         restaurantId,
                //                       );
                //                     },
                //                   ),
                //                 ],
                //               ),
                //             );
                //           }).toList(),
                //         ),
                //         const SizedBox(
                //           height: 20,
                //         ),
                //         SizedBox(
                //           height: 70,
                //           width: Get.width,
                //           child: ElevatedButton(
                //             style: ElevatedButton.styleFrom(
                //               backgroundColor: Colors.deepOrangeAccent,
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               padding: const EdgeInsets.symmetric(vertical: 16),
                //             ),
                //             onPressed: () async {
                //               // Get.to(() => Checkout());
                //               await c.checkout(context);

                //               c.fetchCartItems();
                //             },
                //             child: Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 25, right: 20),
                //               child: Row(
                //                 children: [
                //                   Text(
                //                     'Sub total:\nRs $subtotal', // Display subtotal here
                //                     style: const TextStyle(
                //                         fontSize: 15,
                //                         color: Colors.white,
                //                         fontWeight: FontWeight.bold),
                //                   ),
                //                   const Spacer(),
                //                   const Text(
                //                     "Continue",
                //                     style: TextStyle(
                //                         fontSize: 18, color: Colors.white),
                //                   ),
                //                   const SizedBox(
                //                     width: 5,
                //                   ),
                //                   const Icon(
                //                     Icons.arrow_forward_ios_rounded,
                //                     color: Colors.white,
                //                     size: 18,
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //         const SizedBox(height: 16),
                //       ],
                //     ),
                //   ),
                // );
              },
            ),
          );
        }
      }),
      floatingActionButton: HomeButton(
        onPressed: () {
          // Define what should happen when the home button is pressed
          Get.to(() => Homepage());
        },
      ),
    );
  }
}
