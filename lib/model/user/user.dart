import 'dart:convert';

class User {
  User({
    this.userId,
    this.token
  });

  String? userId;
  String? token;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) =>
      User(userId: json["user_id"]);

  Map<String, dynamic> toMap() => {"user_id": userId};
}
