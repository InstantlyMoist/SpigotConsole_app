import 'package:flutter/cupertino.dart';
import 'package:spigotconsole/models/server_model.dart';
import 'package:web_socket_channel/io.dart';

class ConnectionHandler {

  static var connection;

  static void connect(BuildContext context, ServerModel model, bool setup) {
    connection = IOWebSocketChannel.connect(model.getUrl());
    //TODO: Hash key and send it for key matching
    if (setup) {
      Navigator.pop(context);
      connection.sink.add(model.key);
    }
    // If connection is ok, go to screen

    connection.stream.listen((message) {
      connection.sink.add("received!");
    });
  }

}