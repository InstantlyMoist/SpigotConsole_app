import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spigotconsole/handlers/ConnectionHandler.dart';
import 'package:spigotconsole/models/server_model.dart';

class ListItem extends StatelessWidget {
  final ServerModel model;

  ListItem({this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ConnectionHandler.connect(context, model, false);
      },
      child: Container(
        height: 100,
        color: Colors.red,
        child: Text(model.ip),
      ),
    );
  }
}
