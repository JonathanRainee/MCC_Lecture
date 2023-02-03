import 'package:flutter/painting.dart';

class Palette {
  Palette._();

  static const Color accent = Color.fromARGB(255, 203, 18, 18);

  static const Color buffer = Color.fromARGB(255, 255, 150, 150);

  static const Color black = Color.fromARGB(255, 0, 0, 0);

  static const Color white = Color.fromARGB(255, 255, 255, 255);

  static const Color light = Color.fromARGB(255, 225, 225, 225);

  static const Color dark = Color.fromARGB(255, 120, 120, 120);

  static const Color loadingBase = Color.fromARGB(255, 200, 200, 200);

  static const Color loadingHighlight = Color.fromARGB(255, 225, 225, 225);

  static const Color link = Color.fromARGB(255, 0, 148, 255);

  static const Color error = Color.fromARGB(255, 255, 84, 84);

  static const Color warning = Color.fromARGB(255, 228, 152, 52);

  static const Color success = Color.fromARGB(255, 52, 228, 114);

  static const Color background = Color.fromARGB(255, 255, 255, 255);

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}
