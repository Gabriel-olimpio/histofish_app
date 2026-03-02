enum AppLanguage {
  pt,
  en
}

extension AppLanguageX on AppLanguage {
  String get code => this == AppLanguage.pt ? 'pt' : 'en';
  static AppLanguage? fromCode(String? code) {
    if (code == null) return null;
    for (final lang in AppLanguage.values) {
      if (lang.code == code ) return lang;
    }
    return null;
  }
}

