import 'package:dio/dio.dart';
import 'package:flutter_application_1/consts.dart';

class HTTPService {
  static final HTTPService _singleton = HTTPService.internal();
  factory HTTPService() {
    return _singleton;
  }
  final _dio = Dio();
  HTTPService.internal() {
    setup(null);
  }
  Future<void> setup(String? bearerToken) async {
    final headers = {
      "Content-Type": "application/json",
    };
    final options = BaseOptions(
      baseUrl: API_BASE_URL,
      headers: headers,
      validateStatus: (status) {
        if (status == null) return false;
        return status < 500;
      },
    );
    _dio.options = options;
  }

  Future<Response?> post(String path, Map data) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
      );
      return response;
    } catch (e) {
      print(e);
    }
  }
}
