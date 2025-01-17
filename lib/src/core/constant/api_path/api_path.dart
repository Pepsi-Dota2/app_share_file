class AppApiPath {
  static const String baseUrl = "http://192.168.103.124:8080";
  // OR if you want to keep base URL and port separate:
  // static const String baseUrl = "http://192.168.113.124";
  // static const String port = "8080";
  
  static const String version = "v1"; // removed leading slash
  static const String login = "$baseUrl/$version/user/login";
}