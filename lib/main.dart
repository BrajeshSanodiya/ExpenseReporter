import 'package:expense_reporter/splash.dart';
import 'package:flutter/material.dart';
//import 'package:package_info_plus/package_info_plus.dart';

void main() {

  String textVersion = "1.0.0";
  // final packageInfo = await PackageInfo.fromPlatform();
  // textVersion = "App version: V${packageInfo.version}";

  runApp(MaterialApp(home: SplashScreen(txtVersion:textVersion)));
}
