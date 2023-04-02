import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {

  static final SharedPreferencesRepository _instance = SharedPreferencesRepository
      ._internal();

  factory SharedPreferencesRepository() {
    return _instance;
  }

  SharedPreferencesRepository._internal();

  late SharedPreferences _sharedPreferences;

  Future<void> load() async
  {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getName() => _sharedPreferences.getString("name");
  void setName(String name) => _sharedPreferences.setString("name", name);

}