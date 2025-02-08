/*
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal/config/theme/app_theme.dart';

// Estado del tema (claro u oscuro)
final themeProvider = StateProvider<bool>((ref) => false); // false = claro

// Proveedor de la instancia de AppTheme
final appThemeProvider = Provider<AppTheme>((ref) {
  final isDarkMode = ref.watch(themeProvider);
  return AppTheme(isDarkMode: isDarkMode);
});
*/

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal/config/theme/app_theme.dart';
//import 'package:minimal/presentation/themes/app_theme.dart';

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme(isDarkMode: false));

  void toggleTheme() {
    state = AppTheme(isDarkMode: !state.isDarkMode);
    print(state.isDarkMode);
  }
}

// Usa StateNotifierProvider para permitir cambios de estado
final appThemeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);
