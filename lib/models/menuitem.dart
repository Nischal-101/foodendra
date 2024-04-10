import 'package:foodendra/utils/apis.dart';

class MenuItem {
  String? itemId;
  String? restaurantId;
  String? name;
  String? description;
  String? price;
  String? restaurantName;
  String? foodImage;

  MenuItem(
      {this.itemId,
      this.restaurantId,
      this.name,
      this.description,
      this.price,
      this.restaurantName,
      this.foodImage});

  MenuItem.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id']?.toString();
    restaurantId = json['restaurant_id']?.toString();
    name = json['name'];
    description = json['description'];
    price = json['price']?.toString();
    restaurantName = json['restaurant_name'];
    foodImage = "${Api.baseUrl}/${json['food_image']}";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['restaurant_id'] = restaurantId;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['restaurant_name'] = restaurantName;
    data['food_image'] = foodImage;
    return data;
  }
}

///
// class MenuItem {
//   String? itemId;
//   String? restaurantId;
//   String? name;
//   String? description;
//   String? price;
//   String? restaurantName;
//   String? foodImage;

//   MenuItem(
//       {this.itemId,
//       this.restaurantId,
//       this.name,
//       this.description,
//       this.price,
//       this.restaurantName,
//       this.foodImage});

//   MenuItem.fromJson(Map<String, dynamic> json) {
//     itemId = json['item_id'];
//     restaurantId = json['restaurant_id'];
//     name = json['name'];
//     description = json['description'];
//     price = json['price'];
//     restaurantName = json['restaurant_name'];
//     foodImage = json['food_image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['item_id'] = this.itemId;
//     data['restaurant_id'] = this.restaurantId;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     data['restaurant_name'] = this.restaurantName;
//     data['food_image'] = this.foodImage;
//     return data;
//   }
// }

