import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? width;
  static double? height;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData!.size.width;
    height = _mediaQueryData!.size.height;
  }

  static bool bigScreen() {
    if (height! > 825) {
      return true;
    } else {
      return false;
    }
  }

  static double widthByPercent(double percentage) {
    return width! * (percentage / 100);
  }

  static double heightByPercent(double percentage) {
    return height! * (percentage / 100);
  }
}
