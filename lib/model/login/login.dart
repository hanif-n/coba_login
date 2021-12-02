import 'dart:convert';

class Login {
  Login({
    this.status, 
    this.message, 
    this.token
  });

  String? status;
  String? message;
  String? token;

  factory Login.fromJson(String str) => Login.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Login.fromMap(Map<String, dynamic> json) => Login(
    status: json['status'],
    message: json['message'],
    token: (json['status'] == 'success') ? json['token'] : null
  );

  Map<String, dynamic> toMap() => {
    'status': status, 
    'message': message, 
    'token': token
  };

  bool isSuccess() => status == 'success';
}
