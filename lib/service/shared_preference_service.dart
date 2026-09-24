import 'package:shared_preferences/shared_preferences.dart';

/// Service untuk menyimpan data sederhana menggunakan SharedPreferences.
class SharedPreferenceService {
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyDarkMode = 'is_dark_mode';

  /// Menyimpan status login pengguna.
  Future<void> setLoginStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_keyIsLoggedIn, status);
  }

  /// Mengambil status login pengguna.
  Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  /// Menyimpan status Dark Mode.
  Future<void> setDarkMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_keyDarkMode, isDark);
  }

  /// Mengambil status Dark Mode.
  Future<bool> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_keyDarkMode) ?? false;
  }
}