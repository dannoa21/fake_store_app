part of '../index.dart';

/// A configuration class for the application's theme.
///
/// This theme is the [default theme] file that is used throughout the app.
/// The class provides a static getter [defaultTheme] which returns a [ThemeData] object.
/// In this theme class, we also declare the colors used throughout the app.

class DefaultThemeConfig {
  static ThemeData get defaultTheme {
    return ThemeData(
      colorScheme: const ColorScheme(
        primary: Color(0xFF000000),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFFF4E3B2),
        onSecondary: Color(0xFF000000),
        tertiary: Color(0xFFF9F9F9),
        onTertiary: Color(0xFF1A1A1A),
        error: Color(0xFFC85037),
        onError: Color(0xFFFFFFFF),
        shadow: Color(0xFF2C2C2C),
        outline: Color(0xFFE7E7E7),
        surface: Color(0xFFFFFFFF),
        onSurface: Color(0xFF1A1A1A),
        brightness: Brightness.light,
      ),
      fontFamily: "Urbanist",
      useMaterial3: true,

      // TODO: Implement the text theme according to the design system
      textTheme: TextTheme(
        // Display text
        displayLarge: const TextStyle(
          fontSize: 32,
          height: 40.3 / 32,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: Colors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          height: 35.3 / 28,
          fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
          letterSpacing: 0,
          color: Colors.black,
        ),

        // Headline text
        headlineMedium: TextStyle(
          fontSize: 22,
          height: 27.7 / 22,
          fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
          letterSpacing: 0,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
          fontSize: 19,
          height: 23.9 / 19,
          fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
          letterSpacing: 0,
          color: Colors.black,
        ),

        // Title text
        titleLarge: TextStyle(
          fontSize: 18,
          height: 22.7 / 18,
          fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
          letterSpacing: 0,
          color: Colors.black,
        ),
        titleMedium: TextStyle(
          fontSize: 17,
          height: 21.4 / 17,
          fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
          letterSpacing: 0,
          color: Colors.black,
        ),
        titleSmall: const TextStyle(
          fontSize: 16,
          height: 20.2 / 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: Colors.black,
        ),

        // Body text
        bodyLarge: TextStyle(
          fontSize: 15,
          height: 18.9 / 15,
          fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
          letterSpacing: 0,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 17.6 / 15,
          fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
          letterSpacing: 0,
          color: Colors.black,
        ),
        bodySmall: const TextStyle(
          fontSize: 13,
          height: 16.4 / 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: Colors.black,
        ),
      ),
    );
  }

  ColorScheme colors(BuildContext context) => Theme.of(context).colorScheme;
}
