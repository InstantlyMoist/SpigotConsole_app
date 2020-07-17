import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHandler {

  static SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get sharedPreferences => _sharedPreferences;

  static Future<void> loadSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return;
  }
}
