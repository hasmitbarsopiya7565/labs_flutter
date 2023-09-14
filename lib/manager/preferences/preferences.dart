import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _preference;

  static Future<void> init() async {
    if (_preference != null) return;
    _preference = await SharedPreferences.getInstance();
  }

  static Future<void> setString(
      {required String key, required String value}) async {
    await _preference!.setString(key, value);
  }

  static String? getString({required String key}) {
    return _preference!.getString(key);
  }

  static Future<void> setBool(
      {required String key, required bool value}) async {
    await _preference!.setBool(key, value);
  }

  static bool? getBool({required String key}) {
    return _preference!.getBool(key);
  }

  static Future<void> setInt({required String key, required int value}) async {
    await _preference!.setInt(key, value);
  }

  static int? getInt({required String key}) {
    return _preference!.getInt(key);
  }

  static clearPreferences() async {
    _preference!.clear();
  }
}
