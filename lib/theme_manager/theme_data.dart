import 'package:flutter/material.dart';
import 'package:hyll/utils/HexColor.dart';
import 'package:hyll/utils/app_constants.dart';

final ThemeData kLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    brightness: Brightness.light,
    primaryColor: HexColor.getColor(PRIMARY_COLOR_HEX),
    backgroundColor: Colors.white,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    canvasColor: Colors.transparent,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.red),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black), // set backbutton color here which will reflect in all modules.
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

final ThemeData kDarkTheme = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    primaryColor: HexColor.getColor(PRIMARY_COLOR_HEX),
    backgroundColor: Colors.black,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    canvasColor: Colors.transparent,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.red),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white), // set backbutton color here which will reflect in all modules.
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
