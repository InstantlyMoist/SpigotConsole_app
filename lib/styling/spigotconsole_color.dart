import 'package:flutter/material.dart';

class SpigotConsoleColor {

  bool _darkMode = false;

  // Button
  Color get buttonColor => _darkMode ? const Color(0xFF646464) : const Color(0xFF646464);
  Color get buttonLightShadowColor => _darkMode ? const Color(0xFF979797) : const Color(0xFF979797);
  Color get buttonDarkShadowColor => _darkMode ? const Color(0xFF4B4B4B) : const Color(0xFF4B4B4B);
  Color get buttonTextColor => const Color(0xFFFFFFFF);


  // TextField
  Color get textFieldColor => _darkMode ? const Color(0xFF646464) : const Color(0xFF646464);
  Color get textFieldLightShadowColor => _darkMode ? const Color(0xFF979797) : const Color(0xFF979797);
  Color get textFieldDarkShadowColor => _darkMode ? const Color(0xFF4B4B4B) : const Color(0xFF4B4B4B);
  Color get textFieldInputColor => _darkMode ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);

  // Text
  Color get textColor => _darkMode ? const Color(0xFF000000) : const Color(0xFF000000);
  Color get inputColor => const Color(0xFFFFFFFF);

}