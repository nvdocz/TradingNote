import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/trade_model.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/journal/trade_journal_screen.dart';
import '../../features/trade_form/add_trade_screen.dart';
import '../../features/trade_details/trade_details_screen.dart';
import '../../features/analytics/analytics_screen.dart';
import '../../features/daily_review/daily_review_screen.dart';
import '../../features/strategies/strategy_manager_screen.dart';
import '../../features/profile_settings/profile_settings_screen.dart';
import '../../features/navigation/main_scaffold.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _journalNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _analyticsNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _profileNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/dashboard',
              builder: (context, state) => const DashboardScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _journalNavigatorKey,
          routes: [
            GoRoute(
              path: '/journal',
              builder: (context, state) => const TradeJournalScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _analyticsNavigatorKey,
          routes: [
            GoRoute(
              path: '/analytics',
              builder: (context, state) => const AnalyticsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileSettingsScreen(),
            ),
          ],
        ),
      ],
    ),
    // Modal & Detail Routes
    GoRoute(
      path: '/add-trade',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const AddTradeScreen(),
    ),
    GoRoute(
      path: '/edit-trade',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final trade = state.extra as TradeModel?;
        return AddTradeScreen(initialTrade: trade);
      },
    ),
    GoRoute(
      path: '/trade-details/:id',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return TradeDetailsScreen(tradeId: id);
      },
    ),
    GoRoute(
      path: '/daily-review',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const DailyReviewScreen(),
    ),
    GoRoute(
      path: '/strategies',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const StrategyManagerScreen(),
    ),
  ],
);
