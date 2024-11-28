class AuthService {
  static final AuthService _singleton = AuthService.internal();
  factory AuthService() {
    return _singleton;
  }
  AuthService.internal();
  Future<bool> login(String username, String passward) async {
    print(username);
    return false;
  }
}
