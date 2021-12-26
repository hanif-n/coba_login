import 'dart:io';
import 'package:coba_login/model/login/login.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show TimeoutException;

class ApiClient {
  static Future<Login> login({
    required String userID,
    required String password,
  }) async {
    try {
      Uri uri = Uri.parse('http://192.168.1.2:5000/function/auth');
      http.Response response = await http.post(uri, body: <String, dynamic>{
        'user_id': userID,
        'password': password,
      }).timeout(
        Duration(seconds: 10),
      );
      return Login.fromJson(response.body);
    } on TimeoutException catch (e) {
      stderr.writeln(e);
      return Login(
        status: "failed",
        message: "Connection to server takes too long. Please try again later.",
      );
    }
  }
}
