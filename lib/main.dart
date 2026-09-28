import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/localization/app_localizations.dart';
import 'core/localization/language_provider.dart';
import 'core/theme/app_theme.dart';
import 'features/caregiver/caregiver_dashboard_screen.dart';
import 'features/language_selector/language_selector_screen.dart';
import 'features/patient/patient_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // System UI overlay (transparent status bar)
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  // Init language provider
  final languageProvider = LanguageProvider();
  await languageProvider.init();

  runApp(
    ChangeNotifierProvider<LanguageProvider>.value(
      value: languageProvider,
      child: const NerDementiaCareApp(),
    ),
  );
}

class NerDementiaCareApp extends StatelessWidget {
  const NerDementiaCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    final langProvider = context.watch<LanguageProvider>();

    return MaterialApp(
      title: 'NER Dementia Care',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      // ── Localizations ────────────────────────────────────────────────────
      locale: langProvider.locale,
      supportedLocales: AppLocalizations.locales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) return supportedLocales.first;
        for (final supported in supportedLocales) {
          if (supported.languageCode == locale.languageCode) return supported;
        }
        return supportedLocales.first;
      },

      // ── Routes ───────────────────────────────────────────────────────────
      initialRoute: '/',
      routes: {
        '/': (_) => const LanguageSelectorScreen(),
        '/patient': (_) => const PatientHomeScreen(),
        '/caregiver': (_) => const CaregiverDashboardScreen(),
      },

      // ── Builder: enforce font scale limits for elderly users ─────────────
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(
              MediaQuery.of(context).textScaler.scale(1.0).clamp(1.0, 1.3),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
