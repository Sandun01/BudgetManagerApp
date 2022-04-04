import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  /// Instantiation of the SharedPreferences library keys
  final String _darkThemeKey = "DarkTheme";
  final String _currencyKey = "Currency";

  //constructor
  const AppSharedPreferences();

  // Save Data ====================================================
  // theme
  Future<bool> setAppTheme(bool value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    return sharedPreferences.setBool(_darkThemeKey, value);
  }

  //currency label
  Future<bool> setAppCurrency(String value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    return sharedPreferences.setString(_currencyKey, value);
  }

  // Retrieve data =================================================
  // theme
  Future<bool> getAppTheme() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    return sharedPreferences.getBool(_darkThemeKey) ?? false;
  }

  //currency label
  Future<String> getAppCurrency() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    return sharedPreferences.getString(_currencyKey) ?? 'LKR';
  }
}
