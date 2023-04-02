import 'package:flutter/material.dart';
import 'package:spigotconsole/styling/spigotconsole_color.dart';
import 'package:spigotconsole/ui/text/button_text.dart';

class MinecraftButton extends StatefulWidget {
  MinecraftButton({Key? key}) : super(key: key);

  @override
  State<MinecraftButton> createState() => _MinecraftButtonState();
}

class _MinecraftButtonState extends State<MinecraftButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: Stack(
          children: [
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Column(
                    children: [
                      Ink(
                        width: 2,
                        height: 2,
                        color: SpigotConsoleColor().buttonLightShadowColor,
                      ),
                      Expanded(
                        child: Ink(
                          width: 2,
                          height: double.infinity,
                          color: SpigotConsoleColor().buttonLightShadowColor,
                        ),
                      ),
                      Ink(
                        width: 2,
                        height: 4,
                        color: SpigotConsoleColor()
                            .textFieldDarkShadowColor
                            .withOpacity(0.8),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Ink(
                          height: 2,
                          width: double.infinity,
                          color: SpigotConsoleColor().buttonLightShadowColor,
                        ),
                        Expanded(
                          child: Ink(
                            width: double.infinity,
                            color: SpigotConsoleColor().buttonColor,
                          ),
                        ),
                        Ink(
                          width: double.infinity,
                          height: 4,
                          color: SpigotConsoleColor().textFieldDarkShadowColor,
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Ink(
                        height: 2,
                        width: 2,
                        color: SpigotConsoleColor()
                            .buttonLightShadowColor
                            .withOpacity(0.8),
                      ),
                      Expanded(
                        child: Ink(
                          width: 2,
                          height: double.infinity,
                          color: SpigotConsoleColor().textFieldDarkShadowColor,
                        ),
                      ),
                      Ink(
                        height: 4,
                        width: 2,
                        color: SpigotConsoleColor().textFieldDarkShadowColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: ButtonText(text: "Confirm name"),
            ),
          ],
        ),
      ),
    );
    // return GestureDetector(
    //   onTap: () {
    //     _pressed = true;
    //   },
    //   onTapUp: (details) {
    //     _pressed = false;
    //   },
    //   child: Container(
    //     width: double.infinity,
    //     height: 48,
    //     decoration:BoxDecoration(
    //         boxShadow: [
    //           BoxShadow(
    //             color: SpigotConsoleColor().buttonDarkShadowColor,
    //             spreadRadius: 1,
    //             offset: const Offset(1, 1), // changes position of shadow
    //           ),
    //           BoxShadow(
    //             color: SpigotConsoleColor().buttonLightShadowColor,
    //             spreadRadius: 1,
    //             offset: const Offset(-1, -1), // changes position of shadow
    //           ),
    //           BoxShadow(
    //             color: SpigotConsoleColor().buttonColor,
    //             spreadRadius: -0.5,
    //             blurRadius: 0.5,
    //           ),
    //         ]
    //     ),
    //     child: Text("Kontje"),
    //   ),
    // );
  }
}
