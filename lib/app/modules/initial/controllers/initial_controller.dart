import 'package:get/get.dart';
import "package:news_app/app/data/data_sources/remote/remote_data_sources.dart";

import "../../../config/responses/app_response.dart";

class InitialController extends GetxController {
  final RemoteDataSource _remoteData = Get.put(RemoteDataSource());

  /// TODO : Get News
  Future<AppResponse> getNews(String query, int limit, int skip) async {
    final AppResponse response = await _remoteData.getNews(query, limit, skip);
    return response;
  }
}
