import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';

import '../../core/constants/colors.dart';
import '../../core/providers/providers.dart';
import '../../domain/models/trade_model.dart';
import '../../domain/models/trade_enums.dart';
import '../../data/seed/sample_data_seeder.dart';
import '../../shared/widgets/app_dialogs.dart';

class ProfileSettingsScreen extends ConsumerWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(title: const Text('Profile & Settings')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              // User Profile Card (exact match to reference screenshot)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.goldBorder.withValues(alpha: 0.25),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryGold,
                          width: 1.5,
                        ),
                        color: AppColors.elevatedBackground,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person_outline,
                          color: AppColors.primaryGold,
                          size: 28,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          settings.userName,
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'Personal Trading Journal',
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Settings Menu List (exact match to reference screenshot)
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.goldBorder.withValues(alpha: 0.2),
                  ),
                ),
                child: Column(
                  children: [
                    _buildSettingsItem(
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Accounts',
                      subtitle: '${settings.accounts.length} accounts',
                      onTap: () => _showAccountsDialog(context, ref),
                    ),
                    const Divider(color: AppColors.divider, height: 1),
                    _buildSettingsItem(
                      icon: Icons.candlestick_chart_outlined,
                      title: 'Instruments',
                      subtitle: 'Manage symbols',
                      onTap: () => _showInstrumentsDialog(context, ref),
                    ),
                    const Divider(color: AppColors.divider, height: 1),
                    _buildSettingsItem(
                      icon: Icons.sell_outlined,
                      title: 'Tags',
                      subtitle: 'Manage tags',
                      onTap: () => _showTagsDialog(context, ref),
                    ),
                    const Divider(color: AppColors.divider, height: 1),
                    _buildSettingsItem(
                      icon: Icons.tune_outlined,
                      title: 'Settings',
                      subtitle: 'Currency, market, preferences',
                      onTap: () => _showPreferencesDialog(context, ref),
                    ),
                    const Divider(color: AppColors.divider, height: 1),
                    _buildSettingsItem(
                      icon: Icons.file_upload_outlined,
                      title: 'Export Data',
                      subtitle: 'CSV / JSON backup',
                      onTap: () => _exportData(context, ref),
                    ),
                    const Divider(color: AppColors.divider, height: 1),
                    _buildSettingsItem(
                      icon: Icons.file_download_outlined,
                      title: 'Import Data',
                      subtitle: 'Restore from backup',
                      onTap: () => _importBackup(context, ref),
                    ),
                    const Divider(color: AppColors.divider, height: 1),
                    _buildSettingsItem(
                      icon: Icons.info_outline,
                      title: 'About',
                      subtitle: 'Version 1.0.0',
                      onTap: () => _showAboutDialog(context),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Database Reset Option
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.lossRed.withValues(alpha: 0.3),
                  ),
                ),
                child: _buildSettingsItem(
                  icon: Icons.delete_forever_outlined,
                  iconColor: AppColors.lossRed,
                  title: 'Reset Database',
                  subtitle: 'Erase or reseed trading data',
                  onTap: () => _showResetDialog(context, ref),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.elevatedBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: (iconColor ?? AppColors.primaryGold).withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Icon(icon, color: iconColor ?? AppColors.primaryGold, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primaryText,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: AppColors.secondaryText, fontSize: 12),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        size: 18,
        color: AppColors.mutedText,
      ),
    );
  }

  void _showPreferencesDialog(BuildContext context, WidgetRef ref) {
    final settings = ref.read(settingsProvider);
    String currency = settings.currencySymbol;
    MarketType market = settings.defaultMarket;
    final capitalController = TextEditingController(
      text: settings.startingCapital.toStringAsFixed(0),
    );

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.cardBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: AppColors.goldBorder.withValues(alpha: 0.3),
                ),
              ),
              title: const Text(
                'Trading Preferences',
                style: TextStyle(color: AppColors.primaryGold),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Currency Symbol',
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: ['₹', '\$', '€', '£'].map((c) {
                      final isSel = currency == c;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(c),
                          selected: isSel,
                          onSelected: (_) => setState(() => currency = c),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Default Market',
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      ChoiceChip(
                        label: const Text('NSE'),
                        selected: market == MarketType.nse,
                        onSelected: (_) =>
                            setState(() => market = MarketType.nse),
                      ),
                      const SizedBox(width: 8),
                      ChoiceChip(
                        label: const Text('Forex'),
                        selected: market == MarketType.forex,
                        onSelected: (_) =>
                            setState(() => market = MarketType.forex),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Starting Capital',
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: capitalController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: AppColors.primaryText),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: AppColors.secondaryText),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGold,
                    foregroundColor: AppColors.mainBackground,
                  ),
                  onPressed: () async {
                    final cap =
                        double.tryParse(capitalController.text.trim()) ??
                        100000.0;
                    await ref
                        .read(settingsProvider.notifier)
                        .updateSettings(
                          settings.copyWith(
                            currencySymbol: currency,
                            defaultMarket: market,
                            startingCapital: cap,
                          ),
                        );
                    if (context.mounted) {
                      Navigator.pop(ctx);
                      AppDialogs.showSnackBar(context, 'Preferences updated');
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _exportData(BuildContext context, WidgetRef ref) async {
    final trades = await ref.read(tradeRepositoryProvider).getAllTrades();
    if (trades.isEmpty) {
      if (context.mounted) {
        AppDialogs.showSnackBar(context, 'No trades to export', isError: true);
      }
      return;
    }

    final tempDir = await getTemporaryDirectory();

    // Generate CSV
    final csvBuffer = StringBuffer();
    csvBuffer.writeln(
      'ID,Date,Symbol,Market,Direction,EntryPrice,ExitPrice,Quantity,Costs,GrossPnL,NetPnL,Strategy,Outcome',
    );
    for (final t in trades) {
      csvBuffer.writeln(
        '${t.id},${t.tradeDate.toIso8601String()},${t.symbol},${t.market.label},${t.direction.label},${t.entryPrice},${t.exitPrice ?? ''},${t.quantity},${t.totalCosts},${t.grossPnL},${t.netPnL},"${t.strategy}",${t.outcome.label}',
      );
    }

    final csvFile = File('${tempDir.path}/tradetrack_trades.csv');
    await csvFile.writeAsString(csvBuffer.toString());

    // Generate JSON
    final jsonString = jsonEncode(trades.map((t) => t.toJson()).toList());
    final jsonFile = File('${tempDir.path}/tradetrack_backup.json');
    await jsonFile.writeAsString(jsonString);

    // ignore: deprecated_member_use
    await Share.shareXFiles([
      XFile(csvFile.path),
      XFile(jsonFile.path),
    ], text: 'Trade Track Backup & Export');
  }

  void _importBackup(BuildContext context, WidgetRef ref) async {
    try {
      final result = await FilePickerPlatform.instance.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result.isNotEmpty && result.first.path != null) {
        final file = File(result.first.path!);
        final content = await file.readAsString();
        final decoded = jsonDecode(content);

        if (decoded is List) {
          final trades = decoded
              .map((e) => TradeModel.fromJson(e as Map<String, dynamic>))
              .toList();
          await ref.read(tradeRepositoryProvider).batchInsert(trades);
          if (context.mounted) {
            AppDialogs.showSnackBar(
              context,
              'Imported ${trades.length} trades successfully',
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        AppDialogs.showSnackBar(
          context,
          'Failed to import backup: $e',
          isError: true,
        );
      }
    }
  }

  void _showResetDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.lossRed.withValues(alpha: 0.5)),
          ),
          title: const Text(
            'Reset Database',
            style: TextStyle(color: AppColors.lossRed),
          ),
          content: const Text(
            'Choose whether to completely wipe all trades or restore initial sample data.',
            style: TextStyle(color: AppColors.secondaryText),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text(
                'Cancel',
                style: TextStyle(color: AppColors.secondaryText),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(ctx);
                await ref.read(tradeRepositoryProvider).deleteAllTrades();
                await SampleDataSeeder.seedInitialData(
                  tradeRepo: ref.read(tradeRepositoryProvider),
                  strategyRepo: ref.read(strategyRepositoryProvider),
                  reviewRepo: ref.read(reviewRepositoryProvider),
                  force: true,
                );
                if (context.mounted) {
                  AppDialogs.showSnackBar(context, 'Sample data reseeded');
                }
              },
              child: const Text(
                'Reseed Demo Data',
                style: TextStyle(color: AppColors.primaryGold),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lossRed,
              ),
              onPressed: () async {
                Navigator.pop(ctx);
                await ref.read(tradeRepositoryProvider).deleteAllTrades();
                if (context.mounted) {
                  AppDialogs.showSnackBar(context, 'Database wiped clean');
                }
              },
              child: const Text('Wipe All'),
            ),
          ],
        );
      },
    );
  }

  void _showAccountsDialog(BuildContext context, WidgetRef ref) {
    final settings = ref.read(settingsProvider);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        title: const Text(
          'Trading Accounts',
          style: TextStyle(color: AppColors.primaryGold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: settings.accounts
              .map(
                (acc) => ListTile(
                  leading: const Icon(
                    Icons.check_circle_outline,
                    color: AppColors.primaryGold,
                  ),
                  title: Text(
                    acc,
                    style: const TextStyle(color: AppColors.primaryText),
                  ),
                ),
              )
              .toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showInstrumentsDialog(BuildContext context, WidgetRef ref) {
    final settings = ref.read(settingsProvider);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        title: const Text(
          'Tracked Instruments',
          style: TextStyle(color: AppColors.primaryGold),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: settings.symbols
                .map(
                  (sym) => Chip(
                    backgroundColor: AppColors.elevatedBackground,
                    label: Text(
                      sym,
                      style: const TextStyle(color: AppColors.primaryGold),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showTagsDialog(BuildContext context, WidgetRef ref) {
    final settings = ref.read(settingsProvider);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        title: const Text(
          'Trading Tags',
          style: TextStyle(color: AppColors.primaryGold),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: settings.tags
                .map(
                  (tag) => Chip(
                    backgroundColor: AppColors.elevatedBackground,
                    label: Text(
                      tag,
                      style: const TextStyle(color: AppColors.secondaryText),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        title: const Text(
          'Trade Track',
          style: TextStyle(color: AppColors.primaryGold),
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Version 1.0.0 (Release Build)',
              style: TextStyle(color: AppColors.primaryText),
            ),
            SizedBox(height: 8),
            Text(
              'A completely private, offline trading journal engineered for equity & forex traders to track, analyze, and master trading discipline.',
              style: TextStyle(
                color: AppColors.secondaryText,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
