import 'package:flutter/material.dart';
import 'package:spigotconsole/styling/spigotconsole_text_styling.dart';

class H1 extends StatelessWidget {
  final String text;

  const H1({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: SpigotConsoleTextStyling().h1,
    );
  }
}
