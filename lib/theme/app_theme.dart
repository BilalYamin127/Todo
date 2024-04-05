import 'package:firebase_project/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColorSchemes {
  static const lightColorScheme = ColorScheme.light(
      primary: AppColors.primary,
      inversePrimary: AppColors.secondary,
      tertiary: AppColors.lightGrey,
      surface: AppColors.purple,
      surfaceVariant: AppColors.blackpurple,
      shadow: AppColors.fieldGrey,
      outline: AppColors.blue,
      inverseSurface: AppColors.darkblue,
      tertiaryContainer: AppColors.darkBlue,
      onInverseSurface: AppColors.lightpurple,
      onTertiary: AppColors.darkGrey);
  static const darkColorScheme = ColorScheme.dark(
      primary: AppColors.secondary,
      inversePrimary: AppColors.primary,
      tertiary: AppColors.darkGrey,
      onSurface: AppColors.purple,
      shadow: AppColors.fieldGrey,
      outline: AppColors.blue,
      onInverseSurface: AppColors.darkblue,
      onSurfaceVariant: AppColors.blackpurple,
      inverseSurface: AppColors.primary);
}

class AppTheme {
  static final lightThemeCopy = ThemeData(
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: AppColors.primary,
        todayBackgroundColor: MaterialStatePropertyAll(AppColors.secondary),
      ),
      colorScheme: AppColorSchemes.lightColorScheme,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColors.secondary),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: AppColorSchemes.lightColorScheme.primary,
      ),
      textTheme: AppTextTheme.textTheme(AppColorSchemes.lightColorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            shadowColor: AppColors.shadowColor.withOpacity(0.5),
            backgroundColor: AppColors.appThemeColor,
            foregroundColor: AppColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            minimumSize: const Size(double.infinity, 50),
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.appThemeColor,
          textStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.appThemeColor), // Add your text style here
        ),
      ),
      dialogTheme: DialogTheme(
          backgroundColor: const Color.fromARGB(255, 0, 6, 10).withOpacity(0.5),
          surfaceTintColor: Colors.transparent));
  static final darkTheme = ThemeData(
    colorScheme: AppColorSchemes.darkColorScheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 5,
      shadowColor: AppColors.shadowColor.withOpacity(0.5),
      backgroundColor: AppColorSchemes.darkColorScheme.primary,
    ),
    textTheme: AppTextTheme.textTheme(AppColorSchemes.darkColorScheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.appThemeColor,
          foregroundColor: AppColors.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          minimumSize: const Size(double.infinity, 50),
          textStyle: const TextStyle(fontSize: 12)),
    ),
  );
}

class AppTextTheme {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        /// Use this for titles like in app bars etc
        displayLarge: GoogleFonts.raleway(
          color: colorScheme.inverseSurface,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),

        /// Use this for attribute title or sub headings
        titleLarge: GoogleFonts.raleway(
          color: colorScheme.inverseSurface,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),

        /// Use this for when to bold any kind of attributes in a card or UI widget
        bodyLarge: GoogleFonts.raleway(
          color: colorScheme.inverseSurface,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),

        /// Use this for any kind of attributes in a card or UI widget
        bodyMedium: GoogleFonts.raleway(
          color: colorScheme.inverseSurface,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),

        /// Used for bold headings of textfields and other widgets
        titleMedium: GoogleFonts.raleway(
          color: colorScheme.inverseSurface,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),

        /// Used for non bold/regular headings of textfields and other widgets
        titleSmall: GoogleFonts.raleway(
          color: colorScheme.inverseSurface,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),

        /// Use this for any kind of attributes in a card or UI widget
        bodySmall: GoogleFonts.raleway(
          fontWeight: FontWeight.w400,
          color: colorScheme.inverseSurface,
          fontSize: 12,
        ),
      );
}
