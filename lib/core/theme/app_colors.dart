import 'package:flutter/material.dart';

class AppColors {
  static ColorScheme kColorScheme = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 13, 110, 253),
      primary: Color.fromARGB(255, 13, 110, 253));

  static ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 13, 110, 253),
    primary: Color.fromARGB(255, 13, 110, 253),
    brightness: Brightness.dark,
  );
}
