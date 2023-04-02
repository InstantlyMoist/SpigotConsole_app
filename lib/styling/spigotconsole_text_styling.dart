import 'package:flutter/material.dart';
import 'package:spigotconsole/styling/spigotconsole_color.dart';

class SpigotConsoleTextStyling {
  TextStyle? get h1 => TextStyle(
      fontFamily: "Minecrafter_3",
      fontSize: 18,
      color: SpigotConsoleColor().textColor);

  TextStyle? get p => TextStyle(
      fontFamily: "Minecraft",
      fontSize: 16,
      color: SpigotConsoleColor().textColor);

  TextStyle? get button => TextStyle(
    fontFamily: "Minecraft",
    fontSize: 16,
    color: SpigotConsoleColor().buttonTextColor,
  );

  TextStyle? get input => TextStyle(
        fontFamily: "Minecraft",
        fontSize: 16,
        color: SpigotConsoleColor().inputColor,
      );

  TextStyle? get inputHint => TextStyle(
    fontFamily: "Minecraft",
    fontSize: 16,
    color: SpigotConsoleColor().inputColor.withOpacity(0.5),
  );
}
