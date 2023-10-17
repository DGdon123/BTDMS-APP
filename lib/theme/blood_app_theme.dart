import 'package:flutter/material.dart';

import '../utils/const/app_color/app_color_const.dart';

ThemeData bloodAppTheme() {
  return ThemeData(
    radioTheme: const RadioThemeData(),
    useMaterial3: true,
    fontFamily: "Pop",
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: AppColorConst.white, fontSize: 13, fontFamily: "Pop"),
      iconTheme: IconThemeData(color: AppColorConst.white),
    ),
  );
}
