import "package:get/get.dart";
import "package:news_app/app/data/data_sources/remote/remote_data_sources.dart";

import "../controllers/splash_controller.dart";

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSource());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
