import 'package:flutter/material.dart';
import 'package:radio_station/theme/colors.dart';

final ThemeData themeData = ThemeData(
  primaryColor: rsRed,
  scaffoldBackgroundColor: rsBlack,
  colorScheme: colorScheme,
  textTheme: textTheme,
);

const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: rsRed,
    onPrimary: rsRed,
    secondary: rsRed,
    onSecondary: rsRed,
    error: rsRed,
    onError: rsRed,
    background: rsBlack,
    onBackground: rsBlack,
    surface: rsRed,
    onSurface: rsRed);

const TextTheme textTheme = TextTheme(
  titleMedium: TextStyle(color: Colors.white, fontSize: 15),
  titleSmall: TextStyle(color: Colors.grey, fontSize: 10),
  titleLarge: TextStyle(color: Colors.white, fontSize: 20),
);
