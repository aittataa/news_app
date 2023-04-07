import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";

class LocalDataSources extends GetConnect {
  @override
  void onInit() async {
    final SharedPreferences session = await SharedPreferences.getInstance();
  }
}
