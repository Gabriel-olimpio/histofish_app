

abstract class LanguageStorage {
  Future<String?> readLanguageCode();

  Future<void> saveLanguageCode(String code);

}


