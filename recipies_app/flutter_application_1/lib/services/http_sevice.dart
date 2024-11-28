class HTTPService {
  static final HTTPService _singleton = HTTPService.internal();
  factory HTTPService() {
    return _singleton;
  }
  final _dio = Dio();
  HTTPService.internal(){
    setup();
  };
  Future<void> setup(String? bearerToken)async{}
}
