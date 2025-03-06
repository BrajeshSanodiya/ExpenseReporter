import 'package:expense_reporter/splash.dart';
import 'package:flutter/material.dart';
//import 'package:package_info_plus/package_info_plus.dart';



var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 166, 129, 222));

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 85, 144, 153));
void main() {
  String textVersion = "1.0.0";
  // final packageInfo = await PackageInfo.fromPlatform();
  // textVersion = "App version: V${packageInfo.version}";


runApp(MaterialApp(


  darkTheme: ThemeData.dark().copyWith(colorScheme: kDarkColorScheme,
   cardTheme: const CardTheme().copyWith(
      color: kDarkColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorScheme.primaryContainer,
        foregroundColor: kDarkColorScheme.onPrimaryContainer,
      )
    ),
  ),

  theme: ThemeData().copyWith(
    colorScheme:kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.primaryContainer 
    ),
    cardTheme: const CardTheme().copyWith(
      color: kColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheme.primaryContainer,
      )
    ),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(fontWeight: FontWeight.normal,
      color: kColorScheme.onSecondaryContainer,
      fontSize: 22
      )
    )
  ),
  themeMode: ThemeMode.system,
  home: SplashScreen(txtVersion: textVersion)));
}
