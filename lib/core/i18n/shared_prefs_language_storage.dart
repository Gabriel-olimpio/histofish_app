import 'package:histofish_app/core/i18n/language_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsLanguageStorage implements LanguageStorage {
  static const _key = 'language_code';


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<String?> readLanguageCode() async {
    final prefs = await _prefs;
    return prefs.getString(_key);
  }

  @override
  Future<void> saveLanguageCode(String code) async {
    final prefs = await _prefs;
    await prefs.setString(_key, code);
  }
    
}