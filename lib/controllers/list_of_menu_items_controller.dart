import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodendra/models/menuitem.dart';
import 'package:foodendra/utils/apis.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MenuItemsListController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  // final menuItems = <MenuItem>[].obs;
  // final searchResults = <MenuItem>[].obs;
  // final FocusNode focusNode = FocusNode();
  final menuItems = <Map<String, dynamic>>[].obs;
  final searchResults = List<Map<String, dynamic>>.empty().obs;
  final FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    fetchMenuItems();
    sortMenuItemsByLowPrice();
    sortMenuItemsByHighPrice();
  }

  Future<void> fetchMenuItems() async {
    try {
      final response = await http.get(Uri.parse(Api.getMenuItemsUrl));

      log("All menu items response: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        // menuItems
        //     .assignAll(data.map((menuItem) => MenuItem.fromJson(menuItem)));
        menuItems.assignAll(
            data.map((menuItem) => MenuItem.fromJson(menuItem).toJson()));
      } else {
        throw Exception('Failed to load menu items');
      }
    } catch (e) {
      log('Error fetching menu items: $e');
    }
  }

  // Search feature
  Future<void> searchMenuItems(String query) async {
    try {
      final response = await http
          .get(Uri.parse('${Api.searchMenuItemsResults}?query=$query'));

      log("search menu items response: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        // searchResults
        //     .assignAll(data.map((menuItem) => MenuItem.fromJson(menuItem)));
        searchResults.assignAll(
            data.map((menuItem) => MenuItem.fromJson(menuItem).toJson()));
      } else {
        throw Exception('Failed to search menu items');
      }
    } catch (e) {
      log('Error searching menu items: $e');
      Get.snackbar(
        'Error',
        'Failed to search menu items',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Sorting feature
  Future<void> sortMenuItemsByLowPrice() async {
    try {
      final response =
          await http.get(Uri.parse(Api.sortMenuItemsByLowPriceUrl));

      log("Sort items by Low Price response: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        log("Printing data Low: $data");
        // menuItems
        //     .assignAll(data.map((menuItem) => MenuItem.fromJson(menuItem)));
        searchResults.assignAll(
            data.map((menuItem) => MenuItem.fromJson(menuItem).toJson()));
        log("MenuItems after data asign: $menuItems");
        log("test debug point");
      } else {
        throw Exception('Failed to load menu items');
      }
    } catch (e) {
      log('Error fetching Low Price menu items: $e');
    }
  }

  Future<void> sortMenuItemsByHighPrice() async {
    try {
      final response =
          await http.get(Uri.parse(Api.sortMenuItemsByHighPriceUrl));

      log("Sort items by High Price response: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        searchResults.assignAll(
            data.map((menuItem) => MenuItem.fromJson(menuItem).toJson()));
      } else {
        throw Exception('Failed to load menu items');
      }
    } catch (e) {
      log('Error fetching High Price menu items: $e');
    }
  }
}
