import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeSwitch {
  static ValueNotifier<Brightness> theme = ValueNotifier(Brightness.dark);

  static setTheme(bool isDark) {
    theme.value = isDark ? Brightness.dark : Brightness.light;
    changeStatusNavigatorBar();
  }

  static changeStatusNavigatorBar() {
    bool isDark = theme.value == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarColor: isDark ? const Color (0xFF424242) : const Color(0xFF673AB7),
      systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: isDark ? const Color(0xFF303030) : const Color(0xFFFAFAFF)
      
    ));
  }

    static Color get containerBackgroundColor {
    bool isDark = theme.value == Brightness.dark;
    return isDark ? const Color.fromARGB(255, 82, 82, 82) : const Color(0xFF673AB7);
  }
}