import 'package:flutter/material.dart';
import 'package:spigotconsole/styling/spigotconsole_color.dart';
import 'package:spigotconsole/styling/spigotconsole_padding.dart';
import 'package:spigotconsole/ui/buttons/minecraft_button.dart';
import 'package:spigotconsole/ui/input/minecraft_input.dart';
import 'package:spigotconsole/ui/screens/screen_top_header.dart';
import 'package:spigotconsole/ui/text/H1.dart';
import 'package:spigotconsole/ui/text/p.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenTopHeader(
          child: Container(
            padding: SpigotConsolePadding.basePadding,
            child: Column(
              children: [
                const H1(text: "Welcome to SpigotConsole!"),
                const P(
                    text:
                        "SpigotConsole is a Minecraft server console app for Android and iOS."),
                const P(
                    text:
                        "To get started, please enter your name. This will be used to identify you on the server."),
                const SizedBox(
                  height: 16.0,
                ),
                MinecraftInput(
                  controller: widget.nameController,
                  hintText: "Name",
                ),
                const Spacer(),
                MinecraftButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
