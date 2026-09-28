import 'package:flutter/material.dart';

class AppTheme {
  // ─── Palette (soothing, WCAG AA compliant) ───────────────────────────────
  static const Color primary = Color(0xFF2E7D6E);        // Deep teal – calm
  static const Color primaryLight = Color(0xFF4DB6A4);
  static const Color primaryDark = Color(0xFF1A5248);
  static const Color secondary = Color(0xFFE87C3E);      // Warm amber – energy
  static const Color secondaryLight = Color(0xFFF4A96A);
  static const Color error = Color(0xFFD32F2F);          // SOS red
  static const Color errorLight = Color(0xFFFFCDD2);
  static const Color background = Color(0xFFF5F8F7);     // Off-white – soft
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF1C2B27);   // Deep forest (≥7:1)
  static const Color onSurface = Color(0xFF2A3D39);
  static const Color textSecondary = Color(0xFF5A7570);
  static const Color divider = Color(0xFFCFE0DC);
  static const Color cardShadow = Color(0x1A2E7D6E);

  // ─── Elderl-friendly typography (min 18sp) ───────────────────────────────
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: onBackground, height: 1.25),
    displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: onBackground, height: 1.3),
    displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: onBackground, height: 1.35),
    headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: onBackground, height: 1.4),
    headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: onBackground, height: 1.4),
    headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: onBackground, height: 1.5),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: onBackground, height: 1.5),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: onSurface, height: 1.5),
    titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: onSurface, height: 1.5),
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: onBackground, height: 1.6),
    bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: onSurface, height: 1.6),
    bodySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: textSecondary, height: 1.6),
    labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: onPrimary, letterSpacing: 0.5),
    labelMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: onBackground, letterSpacing: 0.3),
    labelSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: textSecondary, letterSpacing: 0.2),
  );

  // ─── Theme ────────────────────────────────────────────────────────────────
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primary,
          onPrimary: onPrimary,
          primaryContainer: Color(0xFFB2DFDB),
          onPrimaryContainer: primaryDark,
          secondary: secondary,
          onSecondary: onPrimary,
          secondaryContainer: Color(0xFFFFE0CC),
          onSecondaryContainer: Color(0xFF7A3200),
          error: error,
          onError: onPrimary,
          errorContainer: errorLight,
          onErrorContainer: Color(0xFF7F0000),
          surface: surface,
          onSurface: onSurface,
          surfaceContainerHighest: Color(0xFFE0F0EE),
          onSurfaceVariant: textSecondary,
          outline: divider,
          outlineVariant: Color(0xFFE5EFED),
          shadow: cardShadow,
          scrim: Color(0x661C2B27),
          inverseSurface: onBackground,
          onInverseSurface: background,
          inversePrimary: primaryLight,
        ),
        textTheme: textTheme,
        scaffoldBackgroundColor: background,

        // ── AppBar ──────────────────────────────────────────────────────────
        appBarTheme: const AppBarTheme(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: onPrimary,
          ),
          iconTheme: IconThemeData(color: onPrimary, size: 28),
          toolbarHeight: 70,
        ),

        // ── Elevated Button (min 60px touch target) ──────────────────────
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: onPrimary,
            minimumSize: const Size(double.infinity, 60),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            elevation: 3,
          ),
        ),

        // ── Outlined Button ──────────────────────────────────────────────
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: primary,
            side: const BorderSide(color: primary, width: 2),
            minimumSize: const Size(double.infinity, 60),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),

        // ── Text Button ──────────────────────────────────────────────────
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: primary,
            minimumSize: const Size(60, 60),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),

        // ── Card ─────────────────────────────────────────────────────────
        cardTheme: CardThemeData(
          elevation: 4,
          shadowColor: cardShadow,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: surface,
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        ),

        // ── Icon ─────────────────────────────────────────────────────────
        iconTheme: const IconThemeData(color: primary, size: 28),

        // ── Input ─────────────────────────────────────────────────────────
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: divider, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: divider, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: primary, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          labelStyle: const TextStyle(fontSize: 18, color: textSecondary),
          hintStyle: const TextStyle(fontSize: 18, color: textSecondary),
        ),

        // ── Chip ─────────────────────────────────────────────────────────
        chipTheme: ChipThemeData(
          backgroundColor: const Color(0xFFE0F0EE),
          selectedColor: primaryLight,
          labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: onBackground),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),

        // ── FloatingActionButton (min 60px) ──────────────────────────────
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: secondary,
          foregroundColor: onPrimary,
          elevation: 6,
          extendedTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          sizeConstraints: BoxConstraints.tightFor(width: 70, height: 70),
          iconSize: 32,
        ),

        // ── Divider ──────────────────────────────────────────────────────
        dividerTheme: const DividerThemeData(color: divider, thickness: 1.5, space: 24),

        // ── Switch ───────────────────────────────────────────────────────
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith((states) =>
              states.contains(WidgetState.selected) ? primary : Colors.white),
          trackColor: WidgetStateProperty.resolveWith((states) =>
              states.contains(WidgetState.selected) ? primaryLight : divider),
          splashRadius: 30,
        ),
      );

  // ─── Helpers ──────────────────────────────────────────────────────────────
  static BoxDecoration cardDecoration({
    Color color = surface,
    double radius = 20,
    bool withShadow = true,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: withShadow
            ? [
                BoxShadow(
                  color: cardShadow,
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      );

  static BoxDecoration gradientDecoration({
    List<Color>? colors,
    double radius = 20,
  }) =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          colors: colors ?? [primary, primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      );
}
