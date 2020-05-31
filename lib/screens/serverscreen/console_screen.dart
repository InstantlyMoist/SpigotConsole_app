import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spigotconsole/handlers/ConnectionHandler.dart';
import 'package:spigotconsole/screens/serverscreen/consolescreen/console_screen_input.dart';

class ConsoleScreen extends StatefulWidget {
  @override
  _ConsoleScreenState createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends State<ConsoleScreen> {
  final TextEditingController consoleController = new TextEditingController();

  String showingText = "This is the console start";

  @override
  void initState() {
    super.initState();
    ConnectionHandler.messageStream.stream.listen((data) {
      setState(() {
        showingText += "\n${data['message']}";
      });
      print(data);
    });
  }

  void enter(String text) {
    setState(() {
      ConnectionHandler.connection.sink.add(
          jsonEncode({'type': 'CONSOLE', 'message': consoleController.text}));
      consoleController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              color: Theme.of(context).accentColor,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Text(showingText),
              ),
            ),
          ),
          ConsoleScreenInput(
            controller: consoleController,
            numeric: false,
            hint: "Type here...",
            enter: (text) => enter(text),
          ),
        ],
      ),
    );
  }
}
