import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0, 180, 255, 1)),
    textTheme: GoogleFonts.sarabunTextTheme(baseTheme.textTheme),
  );
}
