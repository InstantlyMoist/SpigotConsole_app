import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spigotconsole/dialogs/disconnect_dialog.dart';
import 'package:spigotconsole/dialogs/error_dialog.dart';
import 'package:spigotconsole/models/server_model.dart';
import 'package:spigotconsole/screens/homescreen/connection_dialog.dart';
import 'package:spigotconsole/screens/serverscreen/base_server_screen.dart';
import 'package:web_socket_channel/io.dart';

class ConnectionHandler {

  static IOWebSocketChannel connection;

  static StreamController messageStream;

  static void connect(
      BuildContext context, ServerModel model, bool setup) async {
    if (connection != null) connection.sink.close();
    if (messageStream != null) messageStream.close();

    messageStream = new StreamController.broadcast();

    showDialog(
      context: context,
      child: ConnectionDialog(
        model: model,
      ),
    );

    connection = await IOWebSocketChannel.connect(model.getUrl());

    connection.stream.listen(
      (message) async {
        Map<String, dynamic> response = await jsonDecode(message);
        String receivedType = response['type'];
        String receivedMessage = response['message'];
        switch (receivedType) {
          case "INITIALHANDSHAKE":
            if (receivedMessage == "OK") {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BaseServerScreen(serverModel: model,)),
              );
            } else {
              print("error screen!!!!");
            }
            break;
          default:
            messageStream.add(response);
        }
      },
      onError: (error) {
        Navigator.of(context).pop();
        showDialog(context: context, child: ErrorDialog());
      },
      onDone: () {
        Navigator.of(context).pop();
        showDialog(context: context, child: DisconnectDialog());
      }
    );

    if (setup) Navigator.pop(context);
    connection.sink
        .add(jsonEncode({'type': 'INITIALHANDSHAKE', 'message': model.key}));

    //TODO: Hash key for key init
  }
}
