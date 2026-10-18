import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tradetrack_journal/shared/widgets/gold_button.dart';
import 'package:tradetrack_journal/shared/widgets/financial_metric_card.dart';
import 'package:tradetrack_journal/shared/widgets/status_badge.dart';
import 'package:tradetrack_journal/domain/models/trade_enums.dart';

void main() {
  testWidgets('GoldButton renders and triggers tap', (
    WidgetTester tester,
  ) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GoldButton(text: 'Get Started', onPressed: () => tapped = true),
        ),
      ),
    );

    expect(find.text('Get Started'), findsOneWidget);
    await tester.tap(find.text('Get Started'));
    expect(tapped, isTrue);
  });

  testWidgets('FinancialMetricCard displays values and badge', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FinancialMetricCard(
            title: 'Net P&L',
            value: '₹12,450',
            badgeText: '+8.4%',
            isBadgePositive: true,
          ),
        ),
      ),
    );

    expect(find.text('Net P&L'), findsOneWidget);
    expect(find.text('₹12,450'), findsOneWidget);
    expect(find.text('+8.4%'), findsOneWidget);
  });

  testWidgets('StatusBadge displays correct outcome labels', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              StatusBadge(outcome: TradeOutcome.win),
              StatusBadge(outcome: TradeOutcome.loss),
              StatusBadge(outcome: TradeOutcome.open, status: TradeStatus.open),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Win'), findsOneWidget);
    expect(find.text('Loss'), findsOneWidget);
    expect(find.text('Open'), findsOneWidget);
  });
}
