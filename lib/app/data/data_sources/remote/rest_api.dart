// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class RestAPI {
  /// TODO : New API
  static const String _REST_API = "https://newsapi.org/v2/";
  static const String API_KEY = "5f60ea7c1ddc434c8bbf49423a19cf9e";

  /// TODO : EndPoints
  static const String everything = "everything";
  static const String top_headlines = "top-headlines";

  /// TODO : GET API
  static Uri GET_API(String endPoint) {
    return Uri.parse("$_REST_API/${endPoint}output_format=JSON&ws_key=$API_KEY");
  }
}
