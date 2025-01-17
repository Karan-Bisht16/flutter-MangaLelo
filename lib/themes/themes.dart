import 'package:flutter/material.dart';

abstract class Themes {
  static const lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff4c662b),
    surfaceTint: Color(0xff4c662b),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffcdeda3),
    onPrimaryContainer: Color(0xff102000),
    secondary: Color(0xff586249),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffdce7c8),
    onSecondaryContainer: Color(0xff151e0b),
    tertiary: Color(0xff386663),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffbcece7),
    onTertiaryContainer: Color(0xff00201e),
    error: Color(0xffba1a1a),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff410002),
    surface: Color(0xfff9faef),
    onSurface: Color(0xff1a1c16),
    onSurfaceVariant: Color(0xff44483d),
    outline: Color(0xff75796c),
    outlineVariant: Color(0xffc5c8ba),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff2f312a),
    inversePrimary: Color(0xffb1d18a),
    primaryFixed: Color(0xffcdeda3),
    onPrimaryFixed: Color(0xff102000),
    primaryFixedDim: Color(0xffb1d18a),
    onPrimaryFixedVariant: Color(0xff354e16),
    secondaryFixed: Color(0xffdce7c8),
    onSecondaryFixed: Color(0xff151e0b),
    secondaryFixedDim: Color(0xffbfcbad),
    onSecondaryFixedVariant: Color(0xff404a33),
    tertiaryFixed: Color(0xffbcece7),
    onTertiaryFixed: Color(0xff00201e),
    tertiaryFixedDim: Color(0xffa0d0cb),
    onTertiaryFixedVariant: Color(0xff1f4e4b),
    surfaceDim: Color(0xffdadbd0),
    surfaceBright: Color(0xfff9faef),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xfff3f4e9),
    surfaceContainer: Color(0xffeeefe3),
    surfaceContainerHigh: Color(0xffe8e9de),
    surfaceContainerHighest: Color(0xffe2e3d8),
  );

  static const darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffb5d58e),
    surfaceTint: Color(0xffb1d18a),
    onPrimary: Color(0xff0c1a00),
    primaryContainer: Color(0xff7d9a59),
    onPrimaryContainer: Color(0xff000000),
    secondary: Color(0xffc4cfb1),
    onSecondary: Color(0xff101907),
    secondaryContainer: Color(0xff8a9579),
    onSecondaryContainer: Color(0xff000000),
    tertiary: Color(0xffa4d4d0),
    onTertiary: Color(0xff001a19),
    tertiaryContainer: Color(0xff6b9995),
    onTertiaryContainer: Color(0xff000000),
    error: Color(0xffffbab1),
    onError: Color(0xff370001),
    errorContainer: Color(0xffff5449),
    onErrorContainer: Color(0xff000000),
    surface: Color(0xff12140e),
    onSurface: Color(0xfffbfcf0),
    onSurfaceVariant: Color(0xffc9ccbe),
    outline: Color(0xffa1a497),
    outlineVariant: Color(0xff818578),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffe2e3d8),
    inversePrimary: Color(0xff364f17),
    primaryFixed: Color(0xffcdeda3),
    onPrimaryFixed: Color(0xff081400),
    primaryFixedDim: Color(0xffb1d18a),
    onPrimaryFixedVariant: Color(0xff253d05),
    secondaryFixed: Color(0xffdce7c8),
    onSecondaryFixed: Color(0xff0b1403),
    secondaryFixedDim: Color(0xffbfcbad),
    onSecondaryFixedVariant: Color(0xff303924),
    tertiaryFixed: Color(0xffbcece7),
    onTertiaryFixed: Color(0xff001413),
    tertiaryFixedDim: Color(0xffa0d0cb),
    onTertiaryFixedVariant: Color(0xff083d3a),
    surfaceDim: Color(0xff12140e),
    surfaceBright: Color(0xff383a32),
    surfaceContainerLowest: Color(0xff0c0f09),
    surfaceContainerLow: Color(0xff1a1c16),
    surfaceContainer: Color(0xff1e201a),
    surfaceContainerHigh: Color(0xff282b24),
    surfaceContainerHighest: Color(0xff33362e),
  );

  static const TextStyle productRowItemName = TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle productRowTotal = TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle productRowItemPrice = TextStyle(
    color: Color(0xFF8E8E93),
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle searchText = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle deliveryTimeLabel = TextStyle(
    color: Color(0xFFC2C2C2),
    fontWeight: FontWeight.w300,
  );

  static const TextStyle deliveryTime = TextStyle(
    color: Colors.grey,
  );
}
