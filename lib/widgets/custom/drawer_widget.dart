import 'package:flutter/material.dart';
import 'package:foodendra/controllers/core_controller.dart';
import 'package:foodendra/views/pages/cart_list.dart';
import 'package:foodendra/views/pages/history_page.dart';
import 'package:foodendra/views/pages/list_of_menu_items.dart';
import 'package:foodendra/views/pages/list_of_restaurant.dart';
import 'package:foodendra/views/pages/user_profile.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.c,
  });

  final CoreController c;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.restaurant_menu,
                    size: 40,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Foodendra',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.deepOrangeAccent),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.deepOrangeAccent),
            title: const Text('Profile'),
            onTap: () {
              Get.to(() => UserProfilePage());
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.restaurant, color: Colors.deepOrangeAccent),
            title: const Text('Restaurant'),
            onTap: () {
              Get.to(() => RestaurantList());
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.menu_book, color: Colors.deepOrangeAccent),
            title: const Text('All Menu Items'),
            onTap: () {
              Get.to(() => MenuItemsList());
            },
          ),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.deepOrangeAccent),
            title: const Text('History'),
            onTap: () {
              Get.to(() => const HistoryPage());
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.shopping_cart, color: Colors.deepOrangeAccent),
            title: const Text('Cart'),
            onTap: () {
              Get.to(() => CartItemsView());
            },
          ),
          const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.settings, color: Colors.deepOrangeAccent),
          //   title: const Text('Settings'),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.deepOrangeAccent),
            title: const Text('Log out'),
            onTap: () {
              c.logOut();
            },
          ),
        ],
      ),
    );
  }
}
