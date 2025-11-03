import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isWinterMode = false;
  bool get isWinterMode => _isWinterMode;

  ThemeProvider() {
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _isWinterMode = prefs.getBool('isWinterMode') ?? false;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isWinterMode = !_isWinterMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isWinterMode', _isWinterMode);
    notifyListeners();
  }

  // Light theme colors - Contemporary and elegant
  static const Color lightPrimary = Color(0xFF6366F1);         // Indigo
  static const Color lightSecondary = Color(0xFF8B5CF6);       // Purple
  static const Color lightAccent = Color(0xFF06B6D4);          // Cyan
  static const Color lightBackground = Color(0xFFFEFEFE);       // Pure white
  static const Color lightSurface = Color(0xFFFFFFFF);         // White
  static const Color lightSurfaceVariant = Color(0xFFF8FAFC);  // Light gray
  static const Color lightText = Color(0xFF0F172A);            // Slate 900
  static const Color lightTextSecondary = Color(0xFF64748B);   // Slate 500
  static const Color lightTextTertiary = Color(0xFF94A3B8);    // Slate 400
  static const Color lightBorder = Color(0xFFE2E8F0);          // Slate 200
  static const Color lightError = Color(0xFFEF4444);           // Red 500
  static const Color lightSuccess = Color(0xFF10B981);         // Emerald 500

  // Dark theme colors - Sophisticated and modern
  static const Color darkPrimary = Color(0xFF818CF8);          // Indigo 400
  static const Color darkSecondary = Color(0xFFA78BFA);        // Purple 400
  static const Color darkAccent = Color(0xFF22D3EE);           // Cyan 400
  static const Color darkBackground = Color(0xFF0A0A0A);        // Near black
  static const Color darkSurface = Color(0xFF111111);           // Dark surface
  static const Color darkSurfaceVariant = Color(0xFF1A1A1A);   // Darker surface
  static const Color darkText = Color(0xFFF8FAFC);             // Slate 50
  static const Color darkTextSecondary = Color(0xFFCBD5E1);    // Slate 300
  static const Color darkTextTertiary = Color(0xFF94A3B8);     // Slate 400
  static const Color darkBorder = Color(0xFF334155);           // Slate 700
  static const Color darkError = Color(0xFFF87171);            // Red 400
  static const Color darkSuccess = Color(0xFF34D399);           // Emerald 400

  Color get primaryColor => _isWinterMode ? darkPrimary : lightPrimary;
  Color get secondaryColor => _isWinterMode ? darkSecondary : lightSecondary;
  Color get accentColor => _isWinterMode ? darkAccent : lightAccent;
  Color get backgroundColor => _isWinterMode ? darkBackground : lightBackground;
  Color get surfaceColor => _isWinterMode ? darkSurface : lightSurface;
  Color get surfaceVariantColor => _isWinterMode ? darkSurfaceVariant : lightSurfaceVariant;
  Color get textColor => _isWinterMode ? darkText : lightText;
  Color get textSecondaryColor => _isWinterMode ? darkTextSecondary : lightTextSecondary;
  Color get textTertiaryColor => _isWinterMode ? darkTextTertiary : lightTextTertiary;
  Color get borderColor => _isWinterMode ? darkBorder : lightBorder;
  Color get errorColor => _isWinterMode ? darkError : lightError;
  Color get successColor => _isWinterMode ? darkSuccess : lightSuccess;

  String get themeName => _isWinterMode ? 'Kış' : 'Yaz';
  String get themeIcon => _isWinterMode ? '❄️' : '☀️';
} 