import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodendra/controllers/cart_list_checkout_controller.dart';
import 'package:foodendra/views/pages/check_out.dart';
import 'package:foodendra/views/pages/home_page.dart';
import 'package:foodendra/views/pages/list_of_menu_items.dart';
import 'package:foodendra/widgets/custom/home_button.dart';
import 'package:get/get.dart';

// class CartItemsView extends StatelessWidget {
//   CartItemsView({super.key});

//   final c = Get.put(CartItemsViewController());

//   @override
//   Widget build(BuildContext context) {
//     Get.find<CartItemsViewController>().fetchCartItems();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'My Cart',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.deepOrange,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Obx(() {
//         // if (c.restaurantsWithMenuItems.isEmpty ||
//         //     c.restaurantsWithMenuItems.toString().contains(
//         //         "No restaurant data with menu items found in the cart for the user")) {
//         //   return Center(
//         //     child: Column(
//         //       mainAxisAlignment: MainAxisAlignment.center,
//         //       children: [
//         //         const Text(
//         //           'Your cart is empty!',
//         //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         //         ),
//         //         ElevatedButton(
//         //           onPressed: () {
//         //             Get.to(() => MenuItemsList());
//         //           },
//         //           child: const Text("Explore Menu"),
//         //         ),
//         //       ],
//         //     ),
//         //   );
//         // }
//         if (c.restaurantsWithMenuItems.isEmpty ||
//             c.restaurantsWithMenuItems.toString().contains(
//                 "No restaurant data with menu items found in the cart for the user")) {
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Your cart is empty!',
//                     style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       Get.to(() => MenuItemsList());
//                     },
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all<Color>(Colors.deepOrange),
//                     ),
//                     child: const Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                       child: Text(
//                         "Explore Menu",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return Obx(
//             () => ListView.builder(
//               itemCount: c.restaurantsWithMenuItems.length,
//               itemBuilder: (context, index) {
//                 final restaurantId =
//                     c.restaurantsWithMenuItems.keys.elementAt(index);
//                 final restaurantData = c.restaurantsWithMenuItems[restaurantId];

//                 if (restaurantData == null || restaurantData.isEmpty) {
//                   return const SizedBox.shrink(); // Return an empty widget
//                 }

//                 final restaurantName = restaurantData['restaurant_name'];
//                 final menuItems = restaurantData['menu_items'];

//                 if (menuItems == null || menuItems.isEmpty) {
//                   return const SizedBox.shrink(); // Return an empty widget
//                 }

//                 return Container(
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     border: Border.all(color: Colors.grey.shade300, width: 2),
//                   ),
//                   child: Card(
//                     elevation: 0,
//                     color: Colors.transparent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Text(
//                             restaurantName,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                         Column(
//                           children: menuItems.map<Widget>((menuItem) {
//                             return ListTile(
//                               title: Row(
//                                 children: [
//                                   Text(
//                                     '${menuItem['name']} ',
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'x${menuItem['quantity']}',
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               subtitle: Text(menuItem['description']),
//                               trailing: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Text(
//                                     'Rs ${menuItem['total']}',
//                                     style: const TextStyle(fontSize: 15),
//                                   ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   IconButton(
//                                     icon: Icon(
//                                       Icons.delete_forever,
//                                       size: 30,
//                                       color: Colors.red[500],
//                                     ),
//                                     onPressed: () {
//                                       // Call the method to remove the item from the cart
//                                       c.removeSingleCartItem(
//                                           menuItem['item_id'].toString());
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.deepOrangeAccent,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                               padding: const EdgeInsets.symmetric(vertical: 16),
//                             ),
//                             onPressed: () async {
//                               Get.to(() => Checkout());
//                               // await c.checkout(context);
//                               c.fetchCartItems();
//                             },
//                             child: const Text(
//                               "Continue",
//                               style:
//                                   TextStyle(fontSize: 16, color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         }
//       }),
//       floatingActionButton: HomeButton(
//         onPressed: () {
//           // Define what should happen when the home button is pressed
//           Get.to(() => Homepage());
//         },
//       ),
//     );
//   }
// }

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
                  // final quantity = (menuItem['quantity']);

                  // print('MenuItem: $menuItem');
                  // print('Total: $total, Quantity: $quantity');

                  // print(quantity * double.parse(total));

                  // if (total is int && quantity is int) {
                  //   subtotal += (total) * (quantity);
                  if (menuItem['total'] is String) {
                    subtotal += (double.parse(total)) * (menuItem['quantity']);
                    // log('Helloooo');
                  } else {
                    // Handle the case where 'total' or 'quantity' is not a numeric type
                    log('Warning: Invalid total or quantity for menu itemmmmmmmmmmmmmm: $menuItem');
                  }
                  subtotal = double.parse(subtotal.toStringAsFixed(2));
                }
                // log('Subtotal: $subtotal');

                // log('Subtotal: $subtotal');

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300, width: 2),
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
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            restaurantName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Column(
                          children: menuItems.map<Widget>((menuItem) {
                            return ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    '${menuItem['name']} ',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'x${menuItem['quantity']}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                menuItem['description'],
                                maxLines: 5,
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Rs ${menuItem['total']}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete_outlined,
                                      size: 30,
                                      color: Colors.red[500],
                                    ),
                                    onPressed: () {
                                      c.removeSingleCartItem(
                                        menuItem['item_id'].toString(),
                                        restaurantId,
                                      );
                                    },
                                  ),

                                  // IconButton(
                                  //   icon: Icon(
                                  //     Icons.delete_forever,
                                  //     size: 30,
                                  //     color: Colors.red[500],
                                  //   ),
                                  //   onPressed: () {
                                  //     // Call the method to remove the item from the cart
                                  //     c.removeSingleCartItem(menuItem['item_id'].toString(), menuItem['restaurant_id'].toString());
                                  //   },
                                  // ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                        // Padding(
                        //   padding: const EdgeInsets.all(16),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       const Text(
                        //         'Subtotal:',
                        //         style: TextStyle(
                        //             fontSize: 16, fontWeight: FontWeight.bold),
                        //       ),
                        //       Text(
                        //         'Rs $subtotal', // Display subtotal here
                        //         style: const TextStyle(fontSize: 16),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        ,
                        SizedBox(
                          height: 75,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: () async {
                              // Get.to(() => Checkout());
                              await c.checkout(context);

                              c.fetchCartItems();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'Sub total:\nRs $subtotal', // Display subtotal here
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    "Continue",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: 18,
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
