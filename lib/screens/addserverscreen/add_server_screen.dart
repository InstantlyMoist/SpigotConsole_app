import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spigotconsole/screens/addserverscreen/components/add_server_appbar.dart';
import 'package:spigotconsole/screens/addserverscreen/components/add_server_input.dart';

class AddServerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AddServerAppBar(),
              AddServerInput(),
            ],
          ),
        ),
      ),
    );
  }
}
