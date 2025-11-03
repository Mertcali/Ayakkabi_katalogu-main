import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const AyakkabiKataloguApp(),
    ),
  );
}

class AyakkabiKataloguApp extends StatelessWidget {
  const AyakkabiKataloguApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Ayakkabı Kataloğu',
          debugShowCheckedModeBanner: false,
          theme: _buildTheme(themeProvider),
          home: const HomeScreen(),
        );
      },
    );
  }

  ThemeData _buildTheme(ThemeProvider themeProvider) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'SF Pro Display',
      colorScheme: ColorScheme.fromSeed(
        seedColor: themeProvider.primaryColor,
        brightness: themeProvider.isWinterMode ? Brightness.dark : Brightness.light,
        surface: themeProvider.surfaceColor,
        onSurface: themeProvider.textColor,
        primary: themeProvider.primaryColor,
        secondary: themeProvider.secondaryColor,
        tertiary: themeProvider.accentColor,
        error: themeProvider.errorColor,
        outline: themeProvider.borderColor,
      ),
      scaffoldBackgroundColor: themeProvider.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: themeProvider.textColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: themeProvider.textColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.8,
        ),
        iconTheme: IconThemeData(
          color: themeProvider.textColor,
          size: 24,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeProvider.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: themeProvider.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: themeProvider.primaryColor,
          side: BorderSide(color: themeProvider.primaryColor, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: themeProvider.surfaceColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: themeProvider.borderColor.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        margin: EdgeInsets.zero,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: themeProvider.surfaceVariantColor,
        selectedColor: themeProvider.primaryColor,
        labelStyle: TextStyle(
          color: themeProvider.textColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: themeProvider.textColor,
          fontSize: 40,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.5,
          height: 1.1,
        ),
        displayMedium: TextStyle(
          color: themeProvider.textColor,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -1.0,
          height: 1.2,
        ),
        displaySmall: TextStyle(
          color: themeProvider.textColor,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.8,
          height: 1.3,
        ),
        headlineLarge: TextStyle(
          color: themeProvider.textColor,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.6,
          height: 1.3,
        ),
        headlineMedium: TextStyle(
          color: themeProvider.textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
          height: 1.4,
        ),
        headlineSmall: TextStyle(
          color: themeProvider.textColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.2,
          height: 1.4,
        ),
        titleLarge: TextStyle(
          color: themeProvider.textColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.1,
          height: 1.4,
        ),
        titleMedium: TextStyle(
          color: themeProvider.textColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.0,
          height: 1.4,
        ),
        titleSmall: TextStyle(
          color: themeProvider.textSecondaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.4,
        ),
        bodyLarge: TextStyle(
          color: themeProvider.textColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          color: themeProvider.textSecondaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          color: themeProvider.textTertiaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.2,
          height: 1.5,
        ),
        labelLarge: TextStyle(
          color: themeProvider.textColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.0,
        ),
        labelMedium: TextStyle(
          color: themeProvider.textSecondaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        labelSmall: TextStyle(
          color: themeProvider.textTertiaryColor,
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
