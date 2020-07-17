import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:spigotconsole/handlers/SharedPreferencesHandler.dart';
import 'package:spigotconsole/models/server_model.dart';

class ServerModelHandler {

  static List<ServerModel> serverModels;

  static Future<void> init() {
    serverModels = new List();
    String serverString = SharedPreferencesHandler.sharedPreferences.get("servers");
    if (serverString.isEmpty) return null;
    for (var server in jsonDecode(serverString)) {
      serverModels.add(ServerModel.fromJson(server));
    }
    return null;
  }

  static void addModel(ServerModel model) {
    print("Adding server model " + model.toString());
    serverModels.add(model);
    SharedPreferencesHandler.sharedPreferences.setString("servers", jsonEncode(serverModels));
  }

  static void removeModel(ServerModel model) {
    print("Removing server model " + model.toString());
    serverModels.remove(model);
    SharedPreferencesHandler.sharedPreferences.setString("servers", jsonEncode(serverModels));
  }
}