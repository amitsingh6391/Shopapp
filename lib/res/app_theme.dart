import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'font_family.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData appTheme() {
    return ThemeData(
      fontFamily: AppFonts.poppins,
      primaryColor: AppColors.primaryColor,
      backgroundColor: AppColors.backGroundColor,
      scaffoldBackgroundColor: AppColors.white,
      cardTheme: CardTheme(elevation: 1, margin: EdgeInsets.only()),
      indicatorColor: AppColors.primaryColor,
      accentColor: AppColors.primaryColor,
      buttonTheme: ButtonThemeData(),
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      appBarTheme: AppBarTheme(
          color: AppColors.primaryColor,
          brightness: Brightness.light,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          textTheme: TextTheme(
            headline1: AppTextStyles.medium14Black,
          )),
    );
  }
}
