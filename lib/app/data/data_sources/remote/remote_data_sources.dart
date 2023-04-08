import "dart:convert";
import "dart:developer";

import "package:get/get.dart";
import "package:news_app/app/data/data_sources/remote/rest_api.dart";
import "package:news_app/app/data/models/articles.dart";

import "../../../config/responses/app_response.dart";
import 'package:http/http.dart' as http;

class RemoteDataSource extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = RestAPI.REST_API;
  }

  /// TODO : Get News
  Future<AppResponse> getNews(String query, int limit, int skip) async {
    final String search = "q=$query";
    final String pageSize = "pageSize=$limit";
    final String pageSkip = "page=$skip";
    final String endPoint = "${RestAPI.everything}?$search&$pageSize&$pageSkip";
    final Uri uri = RestAPI.GET_API(endPoint);
    final http.Response response = await http.get(uri);
    final AppResponse appResponse = AppResponse.requestResponse(response);
    if (appResponse.success) {
      try {
        return AppResponse(
          success: appResponse.success,
          messageServer: appResponse.messageServer,
          messageUser: appResponse.messageUser,
          response: articlesFromJson(utf8.decode(response.bodyBytes)),
        );
      } catch (e) {
        return AppResponse(
          success: appResponse.success,
          messageServer: appResponse.messageServer,
          messageUser: appResponse.messageUser,
          response: Articles(articles: <Article>[]),
        );
      }
    } else {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: Articles(articles: <Article>[]),
      );
    }
  }
}
