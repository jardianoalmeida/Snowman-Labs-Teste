import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primarySwatch: Colors.yellow,
  iconTheme: IconThemeData(color: Color(0xff10159A)),
  primaryColor: Color(0xff10159A),
  buttonColor: Colors.yellow,
  brightness: Brightness.light,
  accentColor: Colors.yellow[600],
  appBarTheme: AppBarTheme(
    color: Colors.white,
  ),
  platform: TargetPlatform.iOS
);
