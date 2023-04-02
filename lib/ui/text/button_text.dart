import 'package:flutter/material.dart';
import 'package:spigotconsole/styling/spigotconsole_text_styling.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: SpigotConsoleTextStyling().button);
  }
}
