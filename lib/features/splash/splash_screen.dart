import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/colors.dart';
import '../../core/providers/providers.dart';
import '../../shared/widgets/gold_button.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Section: Logo & Branding
              Column(
                children: [
                  const SizedBox(height: 20),
                  // Logo
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.goldBorder.withValues(alpha: 0.5),
                        width: 1.5,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/images/tradetrack_logo.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.trending_up,
                        size: 40,
                        color: AppColors.primaryGold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Title
                  const Text(
                    'TradeTrack',
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Text(
                    'JOURNAL',
                    style: TextStyle(
                      color: AppColors.primaryGold,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 4.0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Tagline
                  const Text(
                    'TRACK   •   ANALYZE   •   IMPROVE',
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),

              // Center Section: Bull & Bear artwork
              Expanded(
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 340,
                      maxWidth: 340,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryGold.withValues(alpha: 0.08),
                          blurRadius: 30,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/images/bull_bear_splash.jpg',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.candlestick_chart,
                        size: 100,
                        color: AppColors.primaryGold,
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom Section: Get Started Button
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: GoldButton(
                  text: 'Get Started',
                  height: 52,
                  borderRadius: 26,
                  onPressed: () {
                    if (settings.hasCompletedOnboarding) {
                      context.go('/dashboard');
                    } else {
                      context.go('/onboarding');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
