import 'package:flutter/cupertino.dart';

class AppSpacing {
  static const double baseUnit = 4;

  static const double tiny = baseUnit * 1;
  static const double small = baseUnit * 2;
  static const double medium = baseUnit * 4;
  static const double large = baseUnit * 8;
  static const double extraLarge = baseUnit * 16;
  static const double huge = baseUnit * 32;

  static const double screenMargin = medium;
}

class AppSpacingVertical {
  static const Widget tiny = SizedBox(height: AppSpacing.tiny);
  static const Widget small = SizedBox(height: AppSpacing.small);
  static const Widget medium = SizedBox(height: AppSpacing.medium);
  static const Widget large = SizedBox(height: AppSpacing.large);
  static const Widget extraLarge = SizedBox(height: AppSpacing.extraLarge);
  static const Widget huge = SizedBox(height: AppSpacing.huge);
}

class AppSpacingHorizontal {
  static const Widget tiny = SizedBox(width: AppSpacing.tiny);
  static const Widget small = SizedBox(width: AppSpacing.small);
  static const Widget medium = SizedBox(width: AppSpacing.medium);
  static const Widget large = SizedBox(width: AppSpacing.large);
  static const Widget extraLarge = SizedBox(width: AppSpacing.extraLarge);
  static const Widget huge = SizedBox(width: AppSpacing.huge);
}
