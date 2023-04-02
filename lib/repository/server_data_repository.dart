import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spigotconsole/model/server_data.dart';

class ServerDataRepository {
  final API_URL = "https://mcapi.us/server/status?ip=";

  List<ServerData> serverData = [];

  void loadFromPreferences() {
    // Do some fancy loading from preferences

    serverData.add(ServerData("CubeCraft", "play.cubecraft.net", 25565));
    serverData.add(ServerData("PurplePrison", "purpleprison.org"));
  }

  Future<void> refreshAll() async {
    for (ServerData server in serverData) {
      print("Refreshing ${server.name}...");
      String url = "$API_URL${server.ip}";
      if (server.port != null) {
        url += "&port=${server.port}";
      }
      Uri uri = Uri.parse(url);
      print(uri);
      var response = await http.get(uri, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "User-Agent": "SpigotConsole/1.0",
      });
      print(response.body);
      Map<String, dynamic> json = jsonDecode(response.body);
      server.loadFromServerData(json);
    }
  }
}
