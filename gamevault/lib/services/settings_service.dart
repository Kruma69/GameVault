import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  SettingsService._();

  static final SettingsService instance = SettingsService._();

  SharedPreferences? _prefs;

  // Notifier para tema
  final ValueNotifier<bool> darkMode = ValueNotifier<bool>(false);

  // Preferencias simples
  String username = '';
  String preferredPlatform = 'PC';

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    darkMode.value = _prefs?.getBool('darkMode') ?? false;
    username = _prefs?.getString('username') ?? '';
    preferredPlatform = _prefs?.getString('preferredPlatform') ?? 'PC';
  }

  Future<void> setDarkMode(bool value) async {
    darkMode.value = value;
    await _prefs?.setBool('darkMode', value);
  }

  Future<void> setUsername(String value) async {
    username = value;
    await _prefs?.setString('username', value);
  }

  Future<void> setPreferredPlatform(String value) async {
    preferredPlatform = value;
    await _prefs?.setString('preferredPlatform', value);
  }
}
