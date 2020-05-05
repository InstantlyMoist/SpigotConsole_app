import 'package:flutter/cupertino.dart';
import 'package:spigotconsole/handlers/ConnectionHandler.dart';
import 'package:web_socket_channel/io.dart';

class ServerModel {

  final String serverName;
  final String ip;
  final int port;
  final String key;

  ServerModel({this.serverName, this.ip, this.port, this.key});

  ServerModel.fromJson(Map<String, dynamic> json)
      : serverName = json['serverName'],
        ip = json['ip'],
        port = json['port'],
        key = json['key'];

  Map<String, dynamic> toJson() =>
      {'serverName': serverName, 'ip': ip, 'port': port, 'key': key};

  String getUrl() => 'ws://$ip:$port/spigotconsole';

}
