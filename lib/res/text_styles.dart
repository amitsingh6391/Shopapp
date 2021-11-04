import 'dart:ui';

import 'package:flutter/painting.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  /*
  App TextStyle name
  fontWeight+fontSize+fontStyle+ColorName
  */
  static TextStyle get medium14Black => TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );

  static TextStyle get medium28Black => TextStyle(
        fontSize: 28,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get medium20Black => TextStyle(
        fontSize: 20,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get medium15Black => TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      );
}
