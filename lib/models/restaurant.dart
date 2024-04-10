import 'package:foodendra/utils/apis.dart';

class Restaurant {
  String? restaurantId;
  String? restaurantName;
  String? avgRating;
  String? restaurantAddress;
  String? restaurantDescription;
  String? restaurantImage;

  Restaurant(
      {this.restaurantId,
      this.restaurantName,
      this.avgRating,
      this.restaurantAddress,
      this.restaurantDescription,
      this.restaurantImage});

  Restaurant.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    restaurantName = json['restaurant_name'];
    avgRating = json['avg_rating'];
    restaurantAddress = json['restaurant_address'];
    restaurantDescription = json['restaurant_description'];
    restaurantImage = "${Api.baseUrl}/${json['restaurant_image']}";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurant_id'] = restaurantId;
    data['restaurant_name'] = restaurantName;
    data['avg_rating'] = avgRating;
    data['restaurant_address'] = restaurantAddress;
    data['restaurant_description'] = restaurantDescription;
    data['restaurant_image'] = restaurantImage;
    return data;
  }
}
