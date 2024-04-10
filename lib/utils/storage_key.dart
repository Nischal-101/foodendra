import 'dart:developer';
import 'dart:convert';

import 'package:foodendra/models/user.dart';
import 'package:get_storage/get_storage.dart';


class StorageKeys {
  static const String USER = "user";
  static const String ACCESS_TOKEN = "accessToken";
}

class StorageHelper {
  //added
  static Future<void> saveToken(String token) async {
    try {
      final box = GetStorage();
      await box.write(StorageKeys.ACCESS_TOKEN, token);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  static Future<void> saveUser(Map<String, dynamic> userData) async {
    try {
      final box = GetStorage();
      await box.write(StorageKeys.USER, json.encode(userData));
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  static getToken() {
    try {
      final box = GetStorage();
      String token = box.read(StorageKeys.ACCESS_TOKEN);
      return token;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return null;
    }
  }

  static User? getUser() {
    log("Fetching user");
    try {
      final box = GetStorage();
      log("${box.read(StorageKeys.USER)}");
      User user = User.fromJson(json.decode(box.read(StorageKeys.USER)));
      return user;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return null;
    }
  }
}
