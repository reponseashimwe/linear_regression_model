import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF00A86B); // Green
  static const Color accentColor = Color(0xFFE8F5E9); // Light Green background
  static const Color secondaryColor = Color(0xFF00A86B); // Same green
  static const Color errorColor = Color(0xFFE57373); // red-300
  static const Color successColor = Color(0xFF81C784); // green-300
  static const Color warningColor = Color(0xFFFFD54F); // amber-300
  static const Color backgroundColor = Colors.white; // White background
  static const Color cardColor = Colors.white;
  static const Color textPrimaryColor = Color(0xFF212121);
  static const Color textSecondaryColor = Color(0xFF757575);
  static const Color dividerColor = Color(0xFFE0E0E0);

  // Shadow styles
  static List<BoxShadow> subtleShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      offset: const Offset(0, 1),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];
  
  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      offset: const Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];
  
  static List<BoxShadow> strongShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.12),
      offset: const Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  static TextTheme createTextTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
        letterSpacing: -0.5,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
        letterSpacing: -0.5,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
        letterSpacing: -0.5,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
        letterSpacing: -0.5,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: textPrimaryColor,
        letterSpacing: 0.1,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: textSecondaryColor,
        letterSpacing: 0.1,
      ),
    );
  }

  static ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onError: Colors.white,
      background: backgroundColor,
      surface: cardColor,
      onBackground: textPrimaryColor,
      onSurface: textPrimaryColor,
    ),
    textTheme: createTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cardColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: primaryColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: errorColor, width: 1.5),
      ),
      labelStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: textSecondaryColor,
      ),
      floatingLabelStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: textSecondaryColor,
      ),
      hintStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: Color(0xFFBDBDBD),
      ),
      prefixIconColor: textSecondaryColor,
      suffixIconColor: textSecondaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, 
        backgroundColor: primaryColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: const BorderSide(color: primaryColor, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: primaryColor,
        letterSpacing: 0.15,
      ),
      iconTheme: IconThemeData(color: primaryColor),
    ),
    scaffoldBackgroundColor: backgroundColor,
    cardTheme: CardTheme(
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.grey.shade100),
      ),
      color: cardColor,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
    ),
    dividerTheme: const DividerThemeData(
      color: dividerColor,
      thickness: 1,
      space: 24,
    ),
    iconTheme: const IconThemeData(
      color: textSecondaryColor,
      size: 24,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return Colors.transparent;
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: const BorderSide(color: textSecondaryColor, width: 1.5),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: textPrimaryColor,
        letterSpacing: 0.1,
      ),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.all(cardColor),
        elevation: MaterialStateProperty.all(4),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
  );
} 