enum OriginalLanguage {
  any,
  chinese,
  english,
  korean,
}

extension OriginalLanguageExtension on OriginalLanguage {
  String toStr() {
    switch (this) {
      case OriginalLanguage.any:
        return 'Any';
      case OriginalLanguage.chinese:
        return 'Chinese';
      case OriginalLanguage.english:
        return 'English';
      case OriginalLanguage.korean:
        return 'Korean';
      default:
        return 'Chinese';
    }
  }
}
