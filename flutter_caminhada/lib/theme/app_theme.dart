import 'package:flutter/material.dart';

// Cores do app
class AppColors {
  static const Color rosaQueimado = Color(0xFFC97064);
  static const Color rosaClaro = Color(0xFFF7D9D5);
  static const Color rosaFundo = Color(0xFFFFF3F1);
  static const Color cinza = Color(0xFF8A8A8A);
  static const Color fundoEscuro = Color(0xFF2B1E1D);
  static const Color superficieEscura = Color(0xFF3A2A28);
}

final ThemeData temaClaro = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.rosaFundo,
  primaryColor: AppColors.rosaQueimado,
  colorScheme: const ColorScheme.light(
    primary: AppColors.rosaQueimado,
    secondary: AppColors.rosaClaro,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.rosaFundo,
    foregroundColor: Colors.black87,
    elevation: 0,
  ),
  cardColor: Colors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.rosaQueimado,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.rosaQueimado,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);

final ThemeData temaEscuro = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.fundoEscuro,
  primaryColor: AppColors.rosaClaro,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.rosaClaro,
    secondary: AppColors.rosaQueimado,
    surface: AppColors.superficieEscura,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.fundoEscuro,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  cardColor: AppColors.superficieEscura,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.rosaClaro,
    foregroundColor: AppColors.fundoEscuro,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.rosaClaro,
      foregroundColor: AppColors.fundoEscuro,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);
