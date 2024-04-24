class Api {
  // static const String baseUrl = "http://192.168.1.81/foodendra";
  //home ip mathi koooo
  static const String baseUrl = "http://10.0.2.2/foodendra";

  // static const String baseUrl = "http://172.25.3.130/foodendra";

  static const String loginUrl = "$baseUrl/api/login.php";
  static const String registerUrl = "$baseUrl/api/register_user.php";
  static const String allResturantUrl = "$baseUrl/api/get_restaurant.php";
  static const String searchRestaurantItemsResults =
      "$baseUrl/api/search_restaurants.php";
  static const String getMenuItemsUrl = "$baseUrl/api/get_menuitem.php";
  static const String allRecommendedResturantUrl =
      "$baseUrl/api/get_recomm_res.php";
  static const String searchMenuItemsResults =
      "$baseUrl/api/search_menu_items.php";
  static const String sortMenuItemsByLowPriceUrl =
      "$baseUrl/api/sort_menuitem_low.php";
  static const String sortMenuItemsByHighPriceUrl =
      "$baseUrl/api/sort_menuitem_high.php";
  static const String getAddToCartUrl = "$baseUrl/api/addToCart.php";
  static const String getFetchAddToCartByResUrl =
      "$baseUrl/api/get_add_to_cart_by_resturant_user.php";
  static const String checkoutUrl = "$baseUrl/api/checkout.php";
  static const String removeItemsFromCartUrl = "$baseUrl/api/remove_cart.php";
  static const String removeSingleItemsFromCartUrl = "$baseUrl/api/remove_single_item_cart.php";
  static const String getUpdateProfileUrl = "$baseUrl/api/update_user_info.php";
  static const String getOrderHistory = "$baseUrl/api/get_order_history.php";
  // static const String getHistory = "$baseUrl/api/get_appointments.php";
  // static const String getDoctors = "$baseUrl/api/doctors.php";

  // static const String addBooking = "$baseUrl/api/store_appointments.php";
}
