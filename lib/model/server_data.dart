class ServerData {

  String name;
  String ip;
  int? port;

  String? icon;

  String? motd;

  int? maxPlayers;
  int? onlinePlayers;

  ServerData(this.name, this.ip, [this.port]);

  void loadFromServerData(Map<String, dynamic> json) {
    print(json);
    icon = json['favicon'];
    motd = json['motd'];
    maxPlayers = json['players']['max'];
    onlinePlayers = json['players']['now'];
  }
}