import 'package:flutter/material.dart';
import 'package:spigotconsole/styling/spigotconsole_color.dart';
import 'package:spigotconsole/styling/spigotconsole_text_styling.dart';

class MinecraftInput extends StatefulWidget {
  MinecraftInput({Key? key, required this.controller, required this.hintText}) : super(key: key);

  TextEditingController controller;
  String hintText;

  @override
  State<MinecraftInput> createState() => _MinecraftInputState();
}

class _MinecraftInputState extends State<MinecraftInput> {

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: SpigotConsoleColor().textFieldDarkShadowColor,
                spreadRadius: 1,
                offset: const Offset(1, 1), // changes position of shadow
              ),
              BoxShadow(
                color: SpigotConsoleColor().textFieldLightShadowColor,
                spreadRadius: 1,
                offset: const Offset(-1, -1), // changes position of shadow
              ),
              BoxShadow(
                color: _focusNode.hasFocus
                    ? SpigotConsoleColor().textFieldColor.withOpacity(0.8)
                    : SpigotConsoleColor().textFieldColor,
                spreadRadius: -0.5,
                blurRadius: 0.5,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 6.0,
          ),
          child: TextField(
            focusNode: _focusNode,
            style: SpigotConsoleTextStyling().input,
            onTapOutside: (event) {
              _focusNode.unfocus();
            },
            cursorColor: SpigotConsoleColor().textFieldInputColor,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: SpigotConsoleTextStyling().inputHint,
              filled: false,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
