class User {
  String? userId;
  String? username;
  String? email;
  String? password;
  String? address;
  String? phoneNumber;
  String? type;

  User(
      {this.userId,
      this.username,
      this.email,
      this.password,
      this.address,
      this.phoneNumber,
      this.type});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = Map<String, dynamic>();
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['type'] = type;
    return data;
  }
}
