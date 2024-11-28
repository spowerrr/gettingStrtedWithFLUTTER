import 'package:dio/dio.dart';
import 'package:flutter_application_1/services/http_sevice.dart';

class AuthService {
  static final AuthService _singleton = AuthService.internal();
  final _httpService = HTTPService();
  factory AuthService() {
    return _singleton;
  }
  AuthService.internal();
  Future<bool> login(String username, String passward) async {
    //print(username);
    try {
      var response = await _httpService.post("auth/login", {
        "username": username,
        "password": passward,
      });
      //print(response?.statusCode);
      if (response?.statusCode == 200 && response?.data != null) {
        print(response!.data);
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
