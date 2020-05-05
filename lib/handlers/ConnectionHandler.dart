import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:spigotconsole/models/server_model.dart';
import 'package:web_socket_channel/io.dart';

class ConnectionHandler {

  static var connection;

  static void connect(BuildContext context, ServerModel model, bool setup) async {
    connection = await IOWebSocketChannel.connect(model.getUrl());


    //TODO: Hash key and send it for key matching

    if (setup) Navigator.pop(context);
    connection.sink.add(jsonEncode({
      'type': 'INITIALHANDSHAKE',
      'message': model.key
    }));
    // If connection is ok, go to screen

    connection.stream.listen((message) async {
      Map<String, dynamic> response = await jsonDecode(message);
      String receivedType = response['type'];
      String receivedMessage = response['message'];
      switch (receivedType) {
        case "INITIALHANDSHAKE":
          if (receivedMessage == "OK") {
            print("KEY OK");
          } else {
            print("error screen!!!!");
          }
      }



      print(message);
      //connection.sink.add("received!");
    });
  }

}