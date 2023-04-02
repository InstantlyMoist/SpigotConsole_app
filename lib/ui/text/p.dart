import 'package:flutter/material.dart';
import 'package:spigotconsole/styling/spigotconsole_text_styling.dart';

class P extends StatelessWidget {
  final String text;
  final bool withPadding;

  const P({Key? key, required this.text, this.withPadding = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          withPadding ? const EdgeInsets.only(top: 8) : const EdgeInsets.all(0),
      child: Text(
        text,
        style: SpigotConsoleTextStyling().p,
      ),
    );
  }
}
