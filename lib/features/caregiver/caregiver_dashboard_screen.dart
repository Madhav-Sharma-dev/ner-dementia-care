import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/localization/language_provider.dart';
import '../../core/theme/app_theme.dart';

class CaregiverDashboardScreen extends StatefulWidget {
  const CaregiverDashboardScreen({super.key});

  @override
  State<CaregiverDashboardScreen> createState() => _CaregiverDashboardScreenState();
}

class _CaregiverDashboardScreenState extends State<CaregiverDashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  bool _isOnline = true;

  // Mock medication data
  final List<_MedEntry> _medications = [
    _MedEntry(name: 'Donepezil 10mg', time: '08:00 AM', status: _MedStatus.taken, icon: '💊'),
    _MedEntry(name: 'Vitamin D3', time: '12:00 PM', status: _MedStatus.pending, icon: '🌟'),
    _MedEntry(name: 'Memantine 20mg', time: '06:00 PM', status: _MedStatus.pending, icon: '💊'),
    _MedEntry(name: 'Omega-3', time: '09:00 PM', status: _MedStatus.missed, icon: '🐟'),
  ];

  // Mock cognitive score data (last 7 days, 0-100)
  final List<double> _cogScores = [62, 65, 63, 68, 70, 67, 72];
  final List<String> _scoreDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _markMedication(int index, _MedStatus status) {
    setState(() => _medications[index] = _medications[index].copyWith(status: status));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final langProvider = context.watch<LanguageProvider>();

    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnim,
        child: CustomScrollView(
          slivers: [
            // ─── AppBar ────────────────────────────────────────────────────
            SliverAppBar(
              expandedHeight: 160,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1A3A5C), Color(0xFF1565C0), Color(0xFF1976D2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    loc['caregiver_mode'],
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    loc['app_name'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                              // Language display
                              GestureDetector(
                                onTap: () => Navigator.of(context).pushReplacementNamed('/'),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.language, color: Colors.white, size: 18),
                                      const SizedBox(width: 6),
                                      Text(
                                        langProvider.currentLanguageName,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Sync badge
                          _SyncBadge(isOnline: _isOnline, loc: loc),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // ─── Summary Cards ───────────────────────────────────────
                  _buildSummaryRow(loc),
                  const SizedBox(height: 20),

                  // ─── Medication Tracker ──────────────────────────────────
                  _SectionHeader(
                    icon: Icons.medication,
                    title: loc['medication_tracker'],
                    color: const Color(0xFF1565C0),
                  ),
                  const SizedBox(height: 12),
                  ..._medications.asMap().entries.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _MedCard(
                      entry: e.value,
                      loc: loc,
                      onTaken: () => _markMedication(e.key, _MedStatus.taken),
                      onMissed: () => _markMedication(e.key, _MedStatus.missed),
                    ),
                  )),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline, size: 22),
                    label: Text(loc['add_medication']),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF1565C0),
                      side: const BorderSide(color: Color(0xFF1565C0), width: 2),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ─── Cognitive Score Trend ───────────────────────────────
                  _SectionHeader(
                    icon: Icons.trending_up,
                    title: loc['cognitive_score'],
                    color: AppTheme.primary,
                  ),
                  const SizedBox(height: 12),
                  _CognitiveTrendChart(
                    scores: _cogScores,
                    days: _scoreDays,
                    loc: loc,
                  ),
                  const SizedBox(height: 24),

                  // ─── Switch to Patient Mode ──────────────────────────────
                  ElevatedButton.icon(
                    onPressed: () => Navigator.of(context).pushReplacementNamed('/patient'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                    ),
                    icon: const Icon(Icons.person, size: 24),
                    label: Text(loc['patient_mode']),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),

      // ─── Offline toggle FAB (demo) ─────────────────────────────────────────
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() => _isOnline = !_isOnline),
        backgroundColor: _isOnline ? AppTheme.primary : AppTheme.textSecondary,
        icon: Icon(_isOnline ? Icons.cloud_done : Icons.cloud_off, size: 24),
        label: Text(
          _isOnline ? loc['online_sync'] : loc['offline_sync'],
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(AppLocalizations loc) {
    final taken = _medications.where((m) => m.status == _MedStatus.taken).length;
    final missed = _medications.where((m) => m.status == _MedStatus.missed).length;
    final pending = _medications.where((m) => m.status == _MedStatus.pending).length;

    return Row(
      children: [
        Expanded(child: _SummaryChip(label: loc['taken'], count: taken, color: const Color(0xFF2E7D32))),
        const SizedBox(width: 10),
        Expanded(child: _SummaryChip(label: loc['missed'], count: missed, color: AppTheme.error)),
        const SizedBox(width: 10),
        Expanded(child: _SummaryChip(label: loc['pending'], count: pending, color: AppTheme.secondary)),
      ],
    );
  }
}

// ─── Sync Badge Widget ────────────────────────────────────────────────────────
class _SyncBadge extends StatelessWidget {
  final bool isOnline;
  final AppLocalizations loc;

  const _SyncBadge({required this.isOnline, required this.loc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: isOnline
            ? const Color(0xFF1B5E20).withValues(alpha: 0.8)
            : Colors.grey.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isOnline ? Icons.cloud_done : Icons.cloud_off,
            color: isOnline ? Colors.greenAccent : Colors.white70,
            size: 18,
          ),
          const SizedBox(width: 6),
          Text(
            isOnline ? loc['online_sync'] : loc['offline_sync'],
            style: TextStyle(
              fontSize: 14,
              color: isOnline ? Colors.greenAccent : Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Summary Count Chip ───────────────────────────────────────────────────────
class _SummaryChip extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const _SummaryChip({required this.label, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
      ),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color.withValues(alpha: 0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ─── Section Header ───────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _SectionHeader({required this.icon, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
      ],
    );
  }
}

// ─── Medication Entry Data ────────────────────────────────────────────────────
enum _MedStatus { taken, pending, missed }

class _MedEntry {
  final String name;
  final String time;
  final _MedStatus status;
  final String icon;

  const _MedEntry({
    required this.name,
    required this.time,
    required this.status,
    required this.icon,
  });

  _MedEntry copyWith({_MedStatus? status}) =>
      _MedEntry(name: name, time: time, status: status ?? this.status, icon: icon);
}

// ─── Medication Card ──────────────────────────────────────────────────────────
class _MedCard extends StatelessWidget {
  final _MedEntry entry;
  final AppLocalizations loc;
  final VoidCallback onTaken;
  final VoidCallback onMissed;

  const _MedCard({
    required this.entry,
    required this.loc,
    required this.onTaken,
    required this.onMissed,
  });

  Color get _statusColor {
    switch (entry.status) {
      case _MedStatus.taken: return const Color(0xFF2E7D32);
      case _MedStatus.missed: return AppTheme.error;
      case _MedStatus.pending: return AppTheme.secondary;
    }
  }

  String _statusLabel(AppLocalizations loc) {
    switch (entry.status) {
      case _MedStatus.taken: return loc['taken'];
      case _MedStatus.missed: return loc['missed'];
      case _MedStatus.pending: return loc['pending'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _statusColor.withValues(alpha: 0.25), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppTheme.cardShadow,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: _statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(child: Text(entry.icon, style: const TextStyle(fontSize: 24))),
          ),
          const SizedBox(width: 14),

          // Name & Time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.onBackground,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 16, color: AppTheme.textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      entry.time,
                      style: const TextStyle(fontSize: 15, color: AppTheme.textSecondary),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Status badge + actions
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _statusLabel(loc),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _statusColor,
                  ),
                ),
              ),
              if (entry.status == _MedStatus.pending) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onTaken,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2E7D32).withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, color: Color(0xFF2E7D32), size: 20),
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: onMissed,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppTheme.error.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.close, color: AppTheme.error, size: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Cognitive Score Trend Chart (Custom Painter) ─────────────────────────────
class _CognitiveTrendChart extends StatelessWidget {
  final List<double> scores;
  final List<String> days;
  final AppLocalizations loc;

  const _CognitiveTrendChart({
    required this.scores,
    required this.days,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: AppTheme.cardShadow, blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc['score_trend'],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 140,
            child: CustomPaint(
              size: const Size(double.infinity, 140),
              painter: _TrendPainter(scores: scores),
            ),
          ),
          const SizedBox(height: 8),
          // Day labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: days.map((d) => SizedBox(
              width: 36,
              child: Text(
                d,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary, fontWeight: FontWeight.w600),
              ),
            )).toList(),
          ),
          const SizedBox(height: 12),
          // Score legend
          Row(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${loc['cognitive_score']} · Latest: ${scores.last.toInt()}/100',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.onBackground),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TrendPainter extends CustomPainter {
  final List<double> scores;

  _TrendPainter({required this.scores});

  @override
  void paint(Canvas canvas, Size size) {
    if (scores.isEmpty) return;

    final minScore = scores.reduce((a, b) => a < b ? a : b) - 10;
    final maxScore = scores.reduce((a, b) => a > b ? a : b) + 10;
    final range = maxScore - minScore;

    List<Offset> points = [];
    for (int i = 0; i < scores.length; i++) {
      final x = i / (scores.length - 1) * size.width;
      final y = size.height - ((scores[i] - minScore) / range) * size.height;
      points.add(Offset(x, y));
    }

    // Draw gradient fill
    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppTheme.primary.withValues(alpha: 0.35),
          AppTheme.primary.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final fillPath = Path();
    fillPath.moveTo(points.first.dx, size.height);
    for (final p in points) { fillPath.lineTo(p.dx, p.dy); }
    fillPath.lineTo(points.last.dx, size.height);
    fillPath.close();
    canvas.drawPath(fillPath, fillPaint);

    // Draw smooth line
    final linePaint = Paint()
      ..color = AppTheme.primary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final linePath = Path();
    linePath.moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      final cp1 = Offset((points[i - 1].dx + points[i].dx) / 2, points[i - 1].dy);
      final cp2 = Offset((points[i - 1].dx + points[i].dx) / 2, points[i].dy);
      linePath.cubicTo(cp1.dx, cp1.dy, cp2.dx, cp2.dy, points[i].dx, points[i].dy);
    }
    canvas.drawPath(linePath, linePaint);

    // Draw dots
    final dotPaint = Paint()
      ..color = AppTheme.primary
      ..style = PaintingStyle.fill;
    final dotBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (final p in points) {
      canvas.drawCircle(p, 7, dotBorder);
      canvas.drawCircle(p, 5, dotPaint);
    }

    // Score labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (final p in points) {
      final score = scores[points.indexOf(p)].toInt().toString();
      textPainter.text = TextSpan(
        text: score,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppTheme.primaryDark,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(p.dx - textPainter.width / 2, p.dy - 22),
      );
    }
  }

  @override
  bool shouldRepaint(_TrendPainter oldDelegate) => oldDelegate.scores != scores;
}
