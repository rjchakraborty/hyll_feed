
import 'package:flutter/material.dart';

class HexColor {
  static Color getColor(String hexColor) {
    return Color(getColorFromHex(hexColor));
  }

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }

    return int.parse(hexColor, radix: 16);
  }

  static MaterialColor getMaterialColor(final String hexColor) {
    Map<int, Color> color = {
      50: getColor(hexColor).withOpacity(0.1),
      100: getColor(hexColor).withOpacity(0.2),
      200: getColor(hexColor).withOpacity(0.3),
      300: getColor(hexColor).withOpacity(0.4),
      400: getColor(hexColor).withOpacity(0.5),
      500: getColor(hexColor).withOpacity(0.6),
      600: getColor(hexColor).withOpacity(0.7),
      700: getColor(hexColor).withOpacity(0.8),
      800: getColor(hexColor).withOpacity(0.9),
      900: getColor(hexColor).withOpacity(1),
    };

    MaterialColor materialColor = new MaterialColor(getColorFromHex(hexColor), color);
    return materialColor;
  }
}
