// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class RestAPI {
  /// TODO : New API
  static const String REST_API = "https://newsapi.org/v2/";
  static const String API_KEY = "5f60ea7c1ddc434c8bbf49423a19cf9e";

  /// TODO : EndPoints
  static const String everything = "everything";
  static const String top_headlines = "top-headlines";

  /// TODO : Sort
  static const String sort = "sortBy=publishedAt";

  /// TODO : GET API
  static Uri GET_API(String endPoint) {
    return Uri.parse("$REST_API/$endPoint&$sort&language=en&apiKey=$API_KEY");
  }
}
