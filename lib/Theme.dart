import 'package:flutter/material.dart';

class CompanyColors {
  CompanyColors._(); // this basically makes it so you can instantiate this class
  static const Map<int, Color> blue = const <int, Color> {
    50: const Color(0xF200988a),
    100: const Color(0xF200988a),
    200: const Color(0xF200988a),
    300: const Color(0xF200988a),
    400: const Color(0xF200988a),
    500: const Color(0xF200988a),
    600: const Color(0xF200988a),
    700: const Color(0xF200988a),
    800: const Color(0xF200988a),
    900: const Color(0xF200988a)
  };

  static const Map<int, Color> green = const <int, Color> {
    50: const Color(0xF200988a),
    100: const Color(0xF200988a),
    200: const Color(0xF200988a),
    300: const Color(0xF200988a),
    400: const Color(0xF200988a),
    500: const Color(0xF200988a),
    600: const Color(0xF200988a),
    700: const Color(0xF200988a),
    800: const Color(0xF200988a),
    900: const Color(0xF200988a)
  };
  static const int _bluePrimaryValue = 0xFF2196F3;
}
final ThemeData CompanyThemeData = new ThemeData(
    //brightness: Brightness.light,
    primaryColor: Colors.blue,
    //primaryColorBrightness: Brightness.light,
    //accentColor: CompanyColors.green[500],
    //accentColorBrightness: Brightness.light
);