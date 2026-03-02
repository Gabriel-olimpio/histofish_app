import 'package:flutter/foundation.dart';
import 'package:histofish_app/core/i18n/app_language.dart';
import 'package:histofish_app/core/i18n/language_storage.dart';

class AppSettings extends ChangeNotifier{
  final LanguageStorage _languageStorage;

  AppLanguage? _currentLanguage;
  bool _initialized = false;

  AppSettings({required LanguageStorage LanguageStorage})
    : _languageStorage = LanguageStorage;


  AppLanguage? get currentLanguage => _currentLanguage;
  bool get initialized => _initialized;


  Future<void> init() async {
    final code = await _languageStorage.readLanguageCode();
    _currentLanguage = AppLanguageX.fromCode(code);
    _initialized = true;
    notifyListeners();
  }

  Future<void> setLanguage(AppLanguage lang) async {
    _currentLanguage = lang;
    await _languageStorage.saveLanguageCode(lang.code);
    notifyListeners();
  }
}