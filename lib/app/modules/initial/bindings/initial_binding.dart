import "package:get/get.dart";

import "../../../data/data_sources/remote/remote_data_sources.dart";
import "../controllers/initial_controller.dart";

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSource());
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
