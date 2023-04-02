import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spigotconsole/model/server_data.dart';
import 'package:spigotconsole/ui/text/H1.dart';

class ServerTile extends StatelessWidget {
  ServerData serverData;

  ServerTile({Key? key, required this.serverData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (serverData.onlinePlayers == null) {
      widget = const Text("Loading...");
    } else {
      widget = Row(
        children: [
          Image.memory(base64Decode(serverData.icon!.split(",").last), height: 64, width: 64,),
          Column(
            children: [
              H1(text: serverData.name),
              Text("${serverData.onlinePlayers}/${serverData.maxPlayers}"),
            ],
          )
        ],
      );
    }

    return widget;
  }
}
