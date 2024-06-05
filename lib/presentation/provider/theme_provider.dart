import 'package:flutter_demostration/configuration/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorListProvider = Provider((ref) => colorList);

final isDarkModeProvider = StateProvider((ref) => false);

final selectedColorProvider = StateProvider((ref) => 0);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) =>ThemeNotifier()
);

class ThemeNotifier extends StateNotifier<AppTheme>{
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode(){
    state = state.copyWith(
      isDarkMode: !state.isDarkMode
    );
  }

  void changedColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }
}