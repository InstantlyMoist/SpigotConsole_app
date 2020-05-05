import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHandler {
  static SharedPreferences sharedPreferences;

  static Future<void> loadSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return;
  }
}
