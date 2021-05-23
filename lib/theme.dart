import 'package:easy/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: kPrimaryColor,
    appBarTheme: appBarTheme(),
    fontFamily: 'Open Sans',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    color: kPrimaryColor,
    elevation: 0,
    brightness: Brightness.light,
  );
}
