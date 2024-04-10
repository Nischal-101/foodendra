class CartItem {
  final int userId;
  final int restaurantId;
  final int itemId;

  CartItem({required this.userId, required this.restaurantId, required this.itemId});

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'restaurant_id': restaurantId,
      'item_id': itemId,
    };
  }
}
