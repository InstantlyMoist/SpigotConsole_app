import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:spigotconsole/handlers/ConnectionHandler.dart';

class ConsoleScreen extends StatefulWidget {


  @override
  _ConsoleScreenState createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends State<ConsoleScreen> {

  String showingText = "This is the console start";

  @override
  void initState() {
    super.initState();
    ConnectionHandler.messageStream.stream.listen((data) {
      setState(() {
        showingText += "\n${data['message']}";
      });
      print("RECEIVED $data");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Text(showingText),
      ),
    );
  }
}