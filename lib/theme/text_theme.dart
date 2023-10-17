import 'package:flutter/material.dart';

class Sizes {
  const Sizes._();

  static const double dimen_0 = 0;
  static const double dimen_5 = 5;
  static const double dimen_10 = 10;
  static const double dimen_12 = 12;
  static const double dimen_15 = 15;
  static const double dimen_20 = 20;
  static const double dimen_30 = 30;
  static const double dimen_40 = 40;
  static const double dimen_50 = 50;

  static const double dimen_55 = 55;

  static const double dimen_60 = 60;
  static const double dimen_65 = 65;
  static const double dimen_100 = 100;
  static const double dimen_200 = 200;
  static const double dimen_300 = 300;
  static const double dimen_250 = 250;
  static const double dimen_150 = 150;
  static const double dimen_230 = 200;
}

class AppTextTheme {
  AppTextTheme._();

  static const TextTheme appTextTheme = TextTheme(
      displayLarge: _headline1TextTheme,
      bodyLarge: _bodyText1,
      bodyMedium: _bodyText2);

  static const TextStyle _headline1TextTheme = TextStyle(
    fontSize: Sizes.dimen_20,
    fontFamily: 'Poppins-SemiBold',
  );
  static const TextStyle _bodyText1 = TextStyle(
    fontSize: Sizes.dimen_15,
    fontFamily: 'Poppins-Regular',
  );
  static const TextStyle _bodyText2 = TextStyle(
      fontSize: Sizes.dimen_15,
      fontFamily: 'Poppins-Regular',
      color: Colors.black);
}
