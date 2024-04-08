import 'package:firebase_project/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColorSchemes {
  static const lightColorScheme = ColorScheme.light(
      primary: Color.fromARGB(255, 23, 22, 22),
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
      primary: Color.fromARGB(255, 240, 225, 165),
      inversePrimary: Color.fromARGB(255, 0, 0, 0),
      tertiary: AppColors.darkGrey,
      onSurface: Color.fromARGB(255, 164, 128, 231),
      shadow: Color.fromARGB(255, 19, 0, 46),
      outline: AppColors.blue,
      onInverseSurface: AppColors.darkblue,
      onSurfaceVariant: AppColors.blackpurple,
      inverseSurface: Color.fromARGB(255, 242, 239, 239));
}

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    useMaterial3: false,
    colorScheme: AppColorSchemes.lightColorScheme,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: AppColorSchemes.lightColorScheme.primary,
    ),
    textTheme: AppTextTheme.textTheme(AppColorSchemes.lightColorScheme),
  );
  static final darkTheme = ThemeData(
    listTileTheme: ListTileThemeData(
        selectedColor: AppColorSchemes.darkColorScheme.primary,
        leadingAndTrailingTextStyle:
            TextStyle(color: AppColorSchemes.darkColorScheme.inversePrimary)),
    scaffoldBackgroundColor: AppColors.secondary,
    colorScheme: AppColorSchemes.darkColorScheme,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 5,
      shadowColor: AppColors.shadowColor.withOpacity(0.5),
      backgroundColor: AppColorSchemes.darkColorScheme.primary,
    ),
    textTheme: AppTextTheme.textTheme(AppColorSchemes.darkColorScheme),
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
