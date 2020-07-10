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

  RichText finalText;

  List<TextSpan> log;

  GlobalKey key = new GlobalKey();

  @override
  void initState() {
    super.initState();
    log = new List();
    ConnectionHandler.messageStream.stream.listen((data) {
      setState(
        () {
          for (String colorable in data['message'].split('§')) {
            if (colorable.isNotEmpty) {
              print(data['message'].split('§'));
              String colorCode = colorable[0];
              colorable = colorable.substring(1, colorable.length);
              log.add(
                TextSpan(
                  text: colorable,
                  style: TextStyle(
                    fontSize: 12,
                    color: getColor(colorCode),
                  ),
                ),
              );
            }
          }
          log.add(TextSpan(text: "\n"));
        },
      );
    });
  }

  Color getColor(String colorCode) {
    switch(colorCode) {
      case "0": return Colors.black;
      case "1": return Color(0xFF0000AA);
      case "2": return Color(0xFF00AA00);
      case "3": return Color(0xFF00AAAA);
      case "4": return Color(0xFFAA0000);
      case "5": return Color(0xFFAA00AA);
      case "6": return Color(0xFFAA5500);
      case "7": return Color(0xFFAAAAAA);
      case "8": return Color(0xFF555555);
      case "9": return Color(0xFF5555FF);
      case "a": return Color(0xFF55FF55);
      case "b": return Color(0xFF55FFFF);
      case "c": return Color(0xFFFF5555);
      case "d": return Color(0xFFFF55FF);
      case "e": return Color(0xFFFFFF55);
      case "f": return Colors.white;
    }
  }

  void enter(String text) {
    setState(() {
      ConnectionHandler.connection.sink.add(
          jsonEncode({'type': 'CONSOLE', 'message': consoleController.text}));
      consoleController.text = "";
    });
  }

  RichText buildText() {
    print("building text...");
    print(log);
    return RichText(
      text: TextSpan(children: log.toList()),
    );
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
                child: buildText(),
                //child: Text(showingText),
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
