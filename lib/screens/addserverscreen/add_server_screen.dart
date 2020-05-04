import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spigotconsole/screens/addserverscreen/components/add_server_appbar.dart';
import 'package:spigotconsole/screens/addserverscreen/components/add_server_input.dart';
import 'package:spigotconsole/screens/addserverscreen/components/add_server_scanner.dart';

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
              AddServerInput(
                title: "Server name",
                hint: "My Example Server",
                numeric: false,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: AddServerInput(
                      title: "Server IP",
                      hint: "github.com/InstantlyMoist",
                      numeric: false,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: AddServerInput(
                      title: "Port",
                      hint: "25565",
                      numeric: true,
                    ),
                  ),
                ],
              ),
              AddServerScanner(),
            ],
          ),
        ),
      ),
    );
  }
}
