import 'package:flutter/material.dart';

final _borderRadius = BorderRadius.circular(5);

final _lightInputColor = Color.lerp(Colors.teal.shade100, Colors.white, 0.5)!;
final _lightInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: _lightInputColor),
  borderRadius: _borderRadius,
);

final _darkInputColor = Color.lerp(Colors.teal.shade100, Colors.black, 0.6)!;
final _darkInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: _darkInputColor),
  borderRadius: _borderRadius,
);

ThemeData getTheme(Brightness brightness) {
  return ThemeData(
    brightness: brightness,
    primarySwatch: Colors.teal,
    useMaterial3: true,
    scaffoldBackgroundColor: brightness == Brightness.light ? Colors.white : Colors.grey.shade900,
    navigationBarTheme: brightness == Brightness.dark ? NavigationBarThemeData(
      indicatorColor: Colors.teal,
      iconTheme: MaterialStateProperty.all(const IconThemeData(color: Colors.white)),
    ) : null,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: brightness == Brightness.light ? _lightInputColor : _darkInputColor,
      border: brightness == Brightness.light ? _lightInputBorder : _darkInputBorder,
      focusedBorder: brightness == Brightness.light ? _lightInputBorder : _darkInputBorder,
      enabledBorder: brightness == Brightness.light ? _lightInputBorder : _darkInputBorder,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    ),
  );
}

extension ThemeDataExt on ThemeData {
  /// This is the actual [cardColor] being used.
  Color get cardColorWithElevation {
    return ElevationOverlay.applySurfaceTint(cardColor, colorScheme.surfaceTint, 1);
  }
}

extension InputDecorationThemeExt on InputDecorationTheme {
  BorderRadius get borderRadius => _borderRadius;
}
