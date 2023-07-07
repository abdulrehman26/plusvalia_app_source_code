import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plusvalia/core/theme/app_colors.dart';

abstract class AppTheme {
  const AppTheme._();
  static final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.whileScale,
    brightness: Brightness.light,
    textTheme: GoogleFonts.interTextTheme(),
    primaryColor: AppColors.erieBlack,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );
}
