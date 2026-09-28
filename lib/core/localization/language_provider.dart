import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_localizations.dart';

/// Manages the selected language and persists it via SharedPreferences.
class LanguageProvider extends ChangeNotifier {
  static const String _prefKey = 'selected_language_code';

  Locale _locale = const Locale('en');
  bool _isLoaded = false;

  Locale get locale => _locale;
  bool get isLoaded => _isLoaded;

  String get currentLanguageCode => _locale.languageCode;

  String get currentLanguageName =>
      AppLocalizations.supportedLanguages[currentLanguageCode] ?? 'English';

  /// Load saved locale from SharedPreferences on app start
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_prefKey) ?? 'en';
    _locale = AppLocalizations.supportedLocales[code] ?? const Locale('en');
    _isLoaded = true;
    notifyListeners();
  }

  /// Change language and persist selection
  Future<void> setLanguage(String languageCode) async {
    if (!AppLocalizations.supportedLanguages.containsKey(languageCode)) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, languageCode);
    _locale = AppLocalizations.supportedLocales[languageCode] ?? const Locale('en');
    notifyListeners();
  }

  /// Check if the given code is currently selected
  bool isSelected(String code) => currentLanguageCode == code;

  /// Returns the greeting text in the selected language for TTS
  String greetingText() {
    const greetings = {
      'en': 'Welcome to NER Dementia Care. You are safe and loved.',
      'hi': 'NER डिमेंशिया केयर में आपका स्वागत है। आप सुरक्षित हैं और आपको प्यार किया जाता है।',
      'as': 'NER ডিমেনচিয়া কেয়াৰলৈ স্বাগতম। আপুনি সুৰক্ষিত আৰু ভালোপোৱা।',
      'mni': 'NER ডিমেনশিয়া কেয়ারদা পুক্নিং থাগৎকনু। নহাক্না লৈহৌনবা অমসুং চাউনা অমদি অকায়বা।',
      'bod': 'NER डिमेन्सिया केयरमा स्वागत। नों सुरक्षित आरो गोसोखौ मिनथिनो।',
      'kha': 'Wan bah sha NER Dementia Care. Phi long kumno burom bad shynrang.',
      'garo': 'NER Dementia Careni songa. Ninde aro chi·gipaen.',
      'lus': 'NER Dementia Care-ah i thleng thin. I phal tak ani tih ngai rawh.',
    };
    return greetings[currentLanguageCode] ?? greetings['en']!;
  }

  /// Returns TTS language tag for flutter_tts
  String ttsLanguageCode() {
    const ttsCodes = {
      'en': 'en-IN',
      'hi': 'hi-IN',
      'as': 'as-IN',
      'mni': 'mni-IN',
      'bod': 'bo-IN',
      'kha': 'en-IN', // Fallback – no dedicated TTS
      'garo': 'en-IN',
      'lus': 'en-IN',
    };
    return ttsCodes[currentLanguageCode] ?? 'en-IN';
  }
}
