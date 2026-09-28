import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Supported NER locales
class AppLocalizations {
  final Locale locale;
  Map<String, String> _strings = {};

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// Map of language code → display name (native script)
  static const Map<String, String> supportedLanguages = {
    'en': 'English',
    'hi': 'हिन्दी',
    'as': 'অসমীয়া',
    'mni': 'মৈতৈলোন্',
    'bod': 'बर\'',
    'kha': 'Khasi',
    'garo': 'আ·চিক',
    'lus': 'Mizo ṭawng',
  };

  /// Map of language code → locale
  static const Map<String, Locale> supportedLocales = {
    'en': Locale('en'),
    'hi': Locale('hi'),
    'as': Locale('as'),
    'mni': Locale('mni'),
    'bod': Locale('bod'),
    'kha': Locale('kha'),
    'garo': Locale('garo'),
    'lus': Locale('lus'),
  };

  static List<Locale> get locales => supportedLocales.values.toList();

  Future<bool> load() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      _strings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
      return true;
    } catch (_) {
      // Fallback to English if locale file missing
      try {
        final String jsonString =
            await rootBundle.loadString('assets/i18n/en.json');
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        _strings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
      } catch (_) {}
      return false;
    }
  }

  /// Returns translated string or the key itself as fallback
  String translate(String key) => _strings[key] ?? key;

  /// Shorthand operator
  String operator [](String key) => translate(key);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.supportedLocales.containsKey(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
