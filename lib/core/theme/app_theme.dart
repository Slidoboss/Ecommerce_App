import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData themeData = ThemeData().copyWith(
    colorScheme: AppColors.kColorScheme,
    scaffoldBackgroundColor: AppColors.kColorScheme.surface,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.kColorScheme.primary,
        foregroundColor: Colors.white,
        textStyle: ThemeData().textTheme.bodyMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
          titleLarge:
              GoogleFonts.raleway(fontSize: 32, fontWeight: FontWeight.w700),
          titleMedium:
              GoogleFonts.raleway(fontSize: 26, fontWeight: FontWeight.w700),
          headlineLarge:
              GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.w600),
          headlineMedium:
              GoogleFonts.raleway(fontSize: 12, fontWeight: FontWeight.w600),
          headlineSmall:
              GoogleFonts.raleway(fontSize: 8, fontWeight: FontWeight.w600),
          bodyLarge: GoogleFonts.raleway(fontSize: 16),
          bodyMedium: GoogleFonts.raleway(fontSize: 12),
          bodySmall: GoogleFonts.raleway(fontSize: 8),
        ),
  );

  static ThemeData darkThemeData = ThemeData().copyWith(
    colorScheme: AppColors.kColorScheme,
    scaffoldBackgroundColor: AppColors.kDarkColorScheme.surface,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.kDarkColorScheme.primary,
        foregroundColor: Colors.black,
        textStyle: ThemeData().textTheme.bodyMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
          titleLarge:
              GoogleFonts.raleway(fontSize: 32, fontWeight: FontWeight.w700),
          titleMedium:
              GoogleFonts.raleway(fontSize: 26, fontWeight: FontWeight.w700),
          headlineLarge:
              GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.w600),
          headlineMedium:
              GoogleFonts.raleway(fontSize: 12, fontWeight: FontWeight.w600),
          headlineSmall:
              GoogleFonts.raleway(fontSize: 8, fontWeight: FontWeight.w600),
          bodyLarge: GoogleFonts.raleway(fontSize: 16),
          bodyMedium: GoogleFonts.raleway(fontSize: 12),
          bodySmall: GoogleFonts.raleway(fontSize: 8),
        ),
  );

  static double screenWidth(BuildContext context)
  {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    return deviceWidth;
  }

  static double screenHeight(BuildContext context)
  {
    double deviceHeight = MediaQuery.sizeOf(context).height;
    return deviceHeight;
  }
}
