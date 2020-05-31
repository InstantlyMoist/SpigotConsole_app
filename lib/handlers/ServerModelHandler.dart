import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:spigotconsole/handlers/SharedPreferencesHandler.dart';
import 'package:spigotconsole/models/server_model.dart';

class ServerModelHandler {

  static List<ServerModel> serverModels;

  static List<ServerModel> loadServerModels() {
    print("Loading server models");
    serverModels = new List();
    var serverString = SharedPreferencesHandler.sharedPreferences.get("servers");
    if (serverString == null) return serverModels;
    var servers = jsonDecode(serverString);
    print(servers);
    for (var server in servers) {
      serverModels.add(ServerModel.fromJson(server));
    }
    return serverModels;
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