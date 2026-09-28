import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/localization/language_provider.dart';
import '../../core/theme/app_theme.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen>
    with TickerProviderStateMixin {
  final FlutterTts _tts = FlutterTts();
  late Timer _clockTimer;
  late AnimationController _sosController;
  late AnimationController _cardController;
  late Animation<double> _sosPulse;
  late Animation<double> _cardSlide;
  String _timeString = '';
  String _dateString = '';
  bool _isVoiceActive = false;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) => _updateTime());

    _sosController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();

    _sosPulse = Tween<double>(begin: 1.0, end: 1.06).animate(
      CurvedAnimation(parent: _sosController, curve: Curves.easeInOut),
    );
    _cardSlide = CurvedAnimation(parent: _cardController, curve: Curves.easeOutCubic);

    _initTts();
  }

  void _updateTime() {
    if (!mounted) return;
    final now = DateTime.now();
    final h = now.hour.toString().padLeft(2, '0');
    final m = now.minute.toString().padLeft(2, '0');
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    setState(() {
      _timeString = '$h:$m';
      _dateString = '${days[now.weekday - 1]}, ${now.day} ${months[now.month - 1]} ${now.year}';
    });
  }

  Future<void> _initTts() async {
    await _tts.setVolume(1.0);
    await _tts.setSpeechRate(0.42);
    await _tts.setPitch(1.0);
    _tts.setCompletionHandler(() {
      if (mounted) setState(() => _isVoiceActive = false);
    });
  }

  Future<void> _speakGreeting() async {
    final langProvider = context.read<LanguageProvider>();
    HapticFeedback.mediumImpact();
    if (_isVoiceActive) {
      await _tts.stop();
      setState(() => _isVoiceActive = false);
      return;
    }
    setState(() => _isVoiceActive = true);
    try {
      await _tts.setLanguage(langProvider.ttsLanguageCode());
      await _tts.speak(langProvider.greetingText());
    } catch (_) {
      await _tts.setLanguage('en-IN');
      await _tts.speak('Welcome. You are safe and loved.');
    }
  }

  Future<void> _triggerSOS() async {
    HapticFeedback.vibrate();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppTheme.errorLight,
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: AppTheme.error, size: 36),
            SizedBox(width: 12),
            Text(
              'SOS Alert Sent!',
              style: TextStyle(
                color: AppTheme.error,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        content: const Text(
          'Your family and caregiver have been notified.\nHelp is on the way.',
          style: TextStyle(fontSize: 18, height: 1.6, color: AppTheme.onBackground),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
    try {
      await _tts.setLanguage('en-IN');
      await _tts.speak('SOS alert sent. Help is coming. You are safe.');
    } catch (_) {}
  }

  String _getGreeting(AppLocalizations loc) {
    final h = DateTime.now().hour;
    if (h < 12) return loc['good_morning'];
    if (h < 17) return loc['good_afternoon'];
    return loc['good_evening'];
  }

  @override
  void dispose() {
    _clockTimer.cancel();
    _tts.stop();
    _sosController.dispose();
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final langProvider = context.watch<LanguageProvider>();

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // ─── Top Bar: Time / Greeting / Weather ─────────────────────
              SliverAppBar(
                expandedHeight: 180,
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppTheme.primaryDark, AppTheme.primary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Clock
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _timeString,
                                      style: const TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        height: 1.0,
                                      ),
                                    ),
                                    Text(
                                      _dateString,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                // Weather placeholder + Language switcher
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(alpha: 0.15),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: const Row(
                                        children: [
                                          Text('🌤️', style: TextStyle(fontSize: 20)),
                                          SizedBox(width: 6),
                                          Text(
                                            '28°C',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).pushReplacementNamed('/'),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withValues(alpha: 0.15),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          langProvider.currentLanguageName,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${_getGreeting(loc)} 🙏',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // ─── Main Cards ──────────────────────────────────────────────
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 140),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Daily Medicine card
                    _buildAnimatedCard(
                      delay: 0,
                      child: _MainCard(
                        icon: '💊',
                        emoji: '⏰',
                        title: loc['daily_medicine'],
                        subtitle: loc['daily_routine'],
                        gradient: const [Color(0xFF1565C0), Color(0xFF42A5F5)],
                        badge: '3 today',
                        onTap: () {},
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Brain Activities card
                    _buildAnimatedCard(
                      delay: 1,
                      child: _MainCard(
                        icon: '🧩',
                        emoji: '🧠',
                        title: loc['brain_activities'],
                        subtitle: 'Memory games • Music • Stories',
                        gradient: const [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
                        badge: 'New',
                        onTap: () {},
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Family Album card
                    _buildAnimatedCard(
                      delay: 2,
                      child: _MainCard(
                        icon: '📸',
                        emoji: '👨‍👩‍👧‍👦',
                        title: loc['family_album'],
                        subtitle: 'Your loved ones',
                        gradient: const [Color(0xFF2E7D6E), Color(0xFF80CBC4)],
                        badge: '12 photos',
                        onTap: () {},
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Switch to Caregiver
                    OutlinedButton.icon(
                      onPressed: () => Navigator.of(context).pushReplacementNamed('/caregiver'),
                      icon: const Icon(Icons.medical_services_outlined, size: 24),
                      label: Text(loc['caregiver_mode']),
                    ),
                  ]),
                ),
              ),
            ],
          ),

          // ─── Floating Voice Helper ─────────────────────────────────────────
          Positioned(
            right: 20,
            bottom: 120,
            child: FloatingActionButton(
              heroTag: 'voice',
              onPressed: _speakGreeting,
              backgroundColor: _isVoiceActive ? AppTheme.secondaryLight : AppTheme.secondary,
              tooltip: loc['voice_helper'],
              child: Icon(
                _isVoiceActive ? Icons.volume_up : Icons.mic,
                size: 30,
              ),
            ),
          ),

          // ─── Persistent SOS Button (bottom, full width) ───────────────────
          Positioned(
            left: 16,
            right: 16,
            bottom: 28,
            child: AnimatedBuilder(
              animation: _sosPulse,
              builder: (_, child) => Transform.scale(
                scale: _sosPulse.value,
                child: child,
              ),
              child: SizedBox(
                height: 68,
                child: ElevatedButton.icon(
                  onPressed: _triggerSOS,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.error,
                    foregroundColor: Colors.white,
                    elevation: 8,
                    shadowColor: AppTheme.error.withValues(alpha: 0.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    minimumSize: const Size(double.infinity, 68),
                  ),
                  icon: const Icon(Icons.sos, size: 36),
                  label: Text(
                    loc['sos_button'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedCard({required int delay, required Widget child}) {
    return AnimatedBuilder(
      animation: _cardSlide,
      builder: (_, __) {
        final t = (_cardSlide.value - delay * 0.15).clamp(0.0, 1.0);
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - t)),
            child: child,
          ),
        );
      },
    );
  }
}

// ─── Main Feature Card ────────────────────────────────────────────────────────
class _MainCard extends StatelessWidget {
  final String icon;
  final String emoji;
  final String title;
  final String subtitle;
  final List<Color> gradient;
  final String badge;
  final VoidCallback onTap;

  const _MainCard({
    required this.icon,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.gradient,
    required this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: gradient.first.withValues(alpha: 0.35),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Background emoji (watermark)
              Positioned(
                right: -10,
                top: -10,
                child: Text(emoji, style: const TextStyle(fontSize: 90, color: Colors.white12)),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(icon, style: const TextStyle(fontSize: 36)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                subtitle,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            badge,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
