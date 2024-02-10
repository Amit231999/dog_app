import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPageController extends GetxController {
  Future<List<String>> getImageHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('history') ?? [];
  }
}