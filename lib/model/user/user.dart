import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class User {

  static final _storage = FlutterSecureStorage();

  static const _keyUserId = "user_id";
  static const _keyToken = "token";

  static Future<User> fromJson(String str) async =>
      await User.fromMap(json.decode(str));

  Future<String> toJson() async => await json.encode(toMap());

  static Future<User> fromMap(Map<String, dynamic> json) async {
    await User.setUserID(json[_keyUserId]);
    await User.setToken(json[_keyToken]);
    return User();
  }

  static Future<Map<String, dynamic>> toMap() async => {
        _keyUserId: await _storage.read(key: _keyUserId),
        _keyToken: await _storage.read(key: _keyToken),
      };

  static Future setUserID(String? userId) async {
    await _storage.write(
      key: _keyUserId,
      value: userId,
    );
  }

  static Future<String?> getUserID() async =>
      await _storage.read(key: _keyUserId);

  static Future setToken(String? token) async {
    await _storage.write(
      key: _keyToken,
      value: token,
    );
  }
  static Future clear() async =>
    await _storage.deleteAll();
}
