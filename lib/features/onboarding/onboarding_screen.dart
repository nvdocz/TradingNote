import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/colors.dart';
import '../../core/providers/providers.dart';
import '../../domain/models/trade_enums.dart';
import '../../shared/widgets/gold_button.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  String _selectedCurrency = '₹';
  String _selectedCode = 'INR';
  MarketType _selectedMarket = MarketType.nse;
  final TextEditingController _capitalController = TextEditingController(
    text: '100000',
  );

  @override
  void dispose() {
    _capitalController.dispose();
    super.dispose();
  }

  void _finishOnboarding() async {
    final currentSettings = ref.read(settingsProvider);
    final capital = double.tryParse(_capitalController.text.trim()) ?? 100000.0;

    await ref
        .read(settingsProvider.notifier)
        .updateSettings(
          currentSettings.copyWith(
            currencySymbol: _selectedCurrency,
            currencyCode: _selectedCode,
            defaultMarket: _selectedMarket,
            startingCapital: capital,
            hasCompletedOnboarding: true,
          ),
        );

    if (mounted) {
      context.go('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              // Header
              const Text(
                'Welcome to\nTrade Track',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryGold,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your personal trading journal to track, analyze and grow.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryText,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 28),

              // 4 Feature Cards (exact match to reference)
              _buildFeatureCard(
                icon: Icons.assignment_outlined,
                title: 'Track your trades',
                description: 'Record every trade with details',
              ),
              const SizedBox(height: 14),
              _buildFeatureCard(
                icon: Icons.bar_chart_rounded,
                title: 'Analyze performance',
                description: 'Identify what works and what doesn\'t',
              ),
              const SizedBox(height: 14),
              _buildFeatureCard(
                icon: Icons.work_outline,
                title: 'Improve discipline',
                description: 'Build consistency over time',
              ),
              const SizedBox(height: 14),
              _buildFeatureCard(
                icon: Icons.lock_outline,
                title: 'Stay private',
                description: 'All data stored locally on your device',
              ),

              const SizedBox(height: 28),

              // Quick Preference Options
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.goldBorder.withValues(alpha: 0.25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Trading Preferences',
                      style: TextStyle(
                        color: AppColors.primaryGold,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Currency Selection
                    Row(
                      children: [
                        const Text(
                          'Currency:',
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 12),
                        _buildChoiceChip(
                          '₹ (INR)',
                          _selectedCurrency == '₹',
                          () {
                            setState(() {
                              _selectedCurrency = '₹';
                              _selectedCode = 'INR';
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        _buildChoiceChip(
                          '\$ (USD)',
                          _selectedCurrency == '\$',
                          () {
                            setState(() {
                              _selectedCurrency = '\$';
                              _selectedCode = 'USD';
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        _buildChoiceChip(
                          '€ (EUR)',
                          _selectedCurrency == '€',
                          () {
                            setState(() {
                              _selectedCurrency = '€';
                              _selectedCode = 'EUR';
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Market Selection
                    Row(
                      children: [
                        const Text(
                          'Market:    ',
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 12),
                        _buildChoiceChip(
                          'NSE (India)',
                          _selectedMarket == MarketType.nse,
                          () {
                            setState(() => _selectedMarket = MarketType.nse);
                          },
                        ),
                        const SizedBox(width: 8),
                        _buildChoiceChip(
                          'Forex',
                          _selectedMarket == MarketType.forex,
                          () {
                            setState(() => _selectedMarket = MarketType.forex);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 36),

              // Actions
              GoldButton(
                text: 'Continue',
                height: 52,
                borderRadius: 26,
                onPressed: _finishOnboarding,
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: _finishOnboarding,
                child: const Text(
                  'Skip for now',
                  style: TextStyle(
                    color: AppColors.mutedText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.goldBorder.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.elevatedBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.goldBorder.withValues(alpha: 0.4),
                width: 1,
              ),
            ),
            child: Icon(icon, color: AppColors.primaryGold, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryGold.withValues(alpha: 0.2)
              : AppColors.elevatedBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryGold
                : AppColors.goldBorder.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.brightGold : AppColors.secondaryText,
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
