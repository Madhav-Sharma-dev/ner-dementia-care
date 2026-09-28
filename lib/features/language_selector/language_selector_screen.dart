import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/localization/language_provider.dart';
import '../../core/theme/app_theme.dart';

/// Data model for each NER state/language option
class _LanguageOption {
  final String code;
  final String stateName;
  final String nativeName;
  final String emoji;         // Cultural emoji symbol
  final String culturalIcon;  // Unicode symbol representing cultural icon
  final String culturalHint;  // What the icon represents
  final Color accentColor;

  const _LanguageOption({
    required this.code,
    required this.stateName,
    required this.nativeName,
    required this.emoji,
    required this.culturalIcon,
    required this.culturalHint,
    required this.accentColor,
  });
}

class LanguageSelectorScreen extends StatefulWidget {
  const LanguageSelectorScreen({super.key});

  @override
  State<LanguageSelectorScreen> createState() => _LanguageSelectorScreenState();
}

class _LanguageSelectorScreenState extends State<LanguageSelectorScreen>
    with TickerProviderStateMixin {
  final FlutterTts _tts = FlutterTts();
  bool _isSpeaking = false;
  String? _speakingCode;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnim;

  static const List<_LanguageOption> _options = [
    _LanguageOption(
      code: 'en',
      stateName: 'English',
      nativeName: 'English',
      emoji: '🇮🇳',
      culturalIcon: '📖',
      culturalHint: 'Universal',
      accentColor: Color(0xFF1565C0),
    ),
    _LanguageOption(
      code: 'hi',
      stateName: 'Hindi',
      nativeName: 'हिन्दी',
      emoji: '🙏',
      culturalIcon: '🕌',
      culturalHint: 'North India',
      accentColor: Color(0xFFE65100),
    ),
    _LanguageOption(
      code: 'as',
      stateName: 'Assam',
      nativeName: 'অসমীয়া',
      emoji: '🦏',
      culturalIcon: '🍵',
      culturalHint: 'Tea & Rhino',
      accentColor: Color(0xFF2E7D32),
    ),
    _LanguageOption(
      code: 'mni',
      stateName: 'Manipur',
      nativeName: 'মৈতৈলোন্',
      emoji: '🦌',
      culturalIcon: '🌊',
      culturalHint: 'Sangai & Loktak',
      accentColor: Color(0xFF6A1B9A),
    ),
    _LanguageOption(
      code: 'kha',
      stateName: 'Meghalaya',
      nativeName: 'Khasi',
      emoji: '🌉',
      culturalIcon: '🌧️',
      culturalHint: 'Root Bridge & Rain',
      accentColor: Color(0xFF00695C),
    ),
    _LanguageOption(
      code: 'lus',
      stateName: 'Mizoram',
      nativeName: 'Mizo ṭawng',
      emoji: '🌸',
      culturalIcon: '🌺',
      culturalHint: 'Anthurium Flower',
      accentColor: Color(0xFFAD1457),
    ),
    _LanguageOption(
      code: 'garo',
      stateName: 'Nagaland / Garo',
      nativeName: 'আ·চিক',
      emoji: '🐦',
      culturalIcon: '🪘',
      culturalHint: 'Hornbill Festival',
      accentColor: Color(0xFFBF360C),
    ),
    _LanguageOption(
      code: 'bod',
      stateName: 'Bodoland',
      nativeName: 'बर\'',
      emoji: '🎭',
      culturalIcon: '👘',
      culturalHint: 'Dokhona Attire',
      accentColor: Color(0xFF4527A0),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _pulseAnim = Tween<double>(begin: 1.0, end: 1.12).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _initTts();
  }

  Future<void> _initTts() async {
    await _tts.setVolume(1.0);
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);
    _tts.setCompletionHandler(() {
      if (mounted) setState(() { _isSpeaking = false; _speakingCode = null; });
    });
    _tts.setErrorHandler((_) {
      if (mounted) setState(() { _isSpeaking = false; _speakingCode = null; });
    });
  }

  Future<void> _speak(String code) async {
    final langProvider = context.read<LanguageProvider>();
    // Temporarily set locale to get greeting in that language
    final greetings = {
      'en': 'Welcome to NER Dementia Care. You are safe and loved.',
      'hi': 'NER डिमेंशिया केयर में आपका स्वागत है। आप सुरक्षित हैं।',
      'as': 'NER ডিমেনচিয়া কেয়াৰলৈ স্বাগতম। আপুনি সুৰক্ষিত।',
      'mni': 'NER ডিমেনশিয়া কেয়ারদা পুক্নিং থাগৎকনু।',
      'bod': 'NER डिमेन्सिया केयरमा स्वागत। नों सुरक्षित।',
      'kha': 'Wan bah sha NER Dementia Care. Phi long burom.',
      'garo': 'NER Dementia Careni songa. Ninde aro chi·gipaen.',
      'lus': 'NER Dementia Care-ah i thleng thin. I phal tak ani.',
    };

    final ttsCodes = {
      'en': 'en-IN', 'hi': 'hi-IN', 'as': 'as-IN',
      'mni': 'en-IN', 'bod': 'en-IN', 'kha': 'en-IN',
      'garo': 'en-IN', 'lus': 'en-IN',
    };

    HapticFeedback.mediumImpact();

    if (_isSpeaking && _speakingCode == code) {
      await _tts.stop();
      setState(() { _isSpeaking = false; _speakingCode = null; });
      return;
    }

    await _tts.stop();
    setState(() { _isSpeaking = true; _speakingCode = code; });

    try {
      await _tts.setLanguage(ttsCodes[code] ?? 'en-IN');
      await _tts.speak(greetings[code] ?? greetings['en']!);
    } catch (_) {
      // Fallback
      await _tts.setLanguage('en-IN');
      await _tts.speak(greetings['en']!);
    }
    debugPrint('Language: ${langProvider.currentLanguageCode}'); // use langProvider
  }

  Future<void> _selectLanguage(_LanguageOption option) async {
    final langProvider = context.read<LanguageProvider>();
    await langProvider.setLanguage(option.code);
    HapticFeedback.heavyImpact();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Text(
              '${option.nativeName} — ${AppLocalizations.of(context)['language_saved']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        backgroundColor: AppTheme.primary,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  void dispose() {
    _tts.stop();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final langProvider = context.watch<LanguageProvider>();
    final loc = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ─── Header ─────────────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loc['app_name'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    loc['select_language'],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.primaryDark, AppTheme.primary, AppTheme.primaryLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 60),
                    child: Text('🗺️', style: TextStyle(fontSize: 72)),
                  ),
                ),
              ),
            ),
          ),

          // ─── Tap to listen hint ──────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Row(
                children: [
                  AnimatedBuilder(
                    animation: _pulseAnim,
                    builder: (_, child) => Transform.scale(
                      scale: _isSpeaking ? _pulseAnim.value : 1.0,
                      child: child,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.secondary.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isSpeaking ? Icons.volume_up : Icons.touch_app,
                        color: AppTheme.secondary,
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      loc['tap_to_listen'],
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppTheme.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ─── Language Grid ───────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: size.width > 600 ? 3 : 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.88,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final option = _options[index];
                  final isSelected = langProvider.isSelected(option.code);
                  final isSpeakingThis = _speakingCode == option.code && _isSpeaking;
                  return _LanguageCard(
                    option: option,
                    isSelected: isSelected,
                    isSpeaking: isSpeakingThis,
                    onTap: () => _selectLanguage(option),
                    onSpeak: () => _speak(option.code),
                    pulseAnim: _pulseAnim,
                  );
                },
                childCount: _options.length,
              ),
            ),
          ),
        ],
      ),

      // ─── Bottom Bar: Continue ────────────────────────────────────────────
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          boxShadow: [
            BoxShadow(
              color: AppTheme.cardShadow,
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pushReplacementNamed('/patient'),
              icon: const Icon(Icons.person, size: 26),
              label: Text(loc['patient_mode']),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () => Navigator.of(context).pushReplacementNamed('/caregiver'),
              icon: const Icon(Icons.medical_services, size: 26),
              label: Text(loc['caregiver_mode']),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Individual Language Card ─────────────────────────────────────────────────
class _LanguageCard extends StatelessWidget {
  final _LanguageOption option;
  final bool isSelected;
  final bool isSpeaking;
  final VoidCallback onTap;
  final VoidCallback onSpeak;
  final Animation<double> pulseAnim;

  const _LanguageCard({
    required this.option,
    required this.isSelected,
    required this.isSpeaking,
    required this.onTap,
    required this.onSpeak,
    required this.pulseAnim,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        color: isSelected
            ? option.accentColor.withValues(alpha: 0.12)
            : AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? option.accentColor : AppTheme.divider,
          width: isSelected ? 2.5 : 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isSelected
                ? option.accentColor.withValues(alpha: 0.2)
                : AppTheme.cardShadow,
            blurRadius: isSelected ? 16 : 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          splashColor: option.accentColor.withValues(alpha: 0.2),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Top row: emoji + check ────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(option.emoji, style: const TextStyle(fontSize: 34)),
                    if (isSelected)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: option.accentColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, color: Colors.white, size: 16),
                      ),
                  ],
                ),
                const SizedBox(height: 8),

                // ── Language name ────────────────────────────────────
                Text(
                  option.nativeName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: isSelected ? option.accentColor : AppTheme.onBackground,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  option.stateName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Spacer(),

                // ── Cultural icon hint ────────────────────────────────
                Row(
                  children: [
                    Text(option.culturalIcon, style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        option.culturalHint,
                        style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // ── Speaker button (full width, min 44px) ────────────
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: onSpeak,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSpeaking
                          ? option.accentColor
                          : option.accentColor.withValues(alpha: 0.1),
                      foregroundColor: isSpeaking ? Colors.white : option.accentColor,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(0, 44),
                    ),
                    child: AnimatedBuilder(
                      animation: pulseAnim,
                      builder: (_, child) => Transform.scale(
                        scale: isSpeaking ? pulseAnim.value : 1.0,
                        child: child,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isSpeaking ? Icons.volume_up : Icons.volume_up_outlined,
                            size: 20,
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Listen',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
