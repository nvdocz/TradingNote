import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/colors.dart';
import '../../core/providers/providers.dart';
import '../../core/utils/currency_formatter.dart';
import '../../core/utils/date_time_utils.dart';
import '../../domain/engine/trading_calculation_engine.dart';
import '../../domain/models/trade_model.dart';
import '../../domain/models/trade_enums.dart';
import '../../shared/widgets/gold_button.dart';
import '../../shared/widgets/app_dialogs.dart';

class AddTradeScreen extends ConsumerStatefulWidget {
  final TradeModel? initialTrade;

  const AddTradeScreen({super.key, this.initialTrade});

  @override
  ConsumerState<AddTradeScreen> createState() => _AddTradeScreenState();
}

class _AddTradeScreenState extends ConsumerState<AddTradeScreen> {
  final _formKey = GlobalKey<FormState>();

  late DateTime _tradeDate;
  late MarketType _market;
  late TradeDirection _direction;

  late TextEditingController _symbolController;
  late TextEditingController _entryPriceController;
  late TextEditingController _exitPriceController;
  late TextEditingController _quantityController;
  late TextEditingController _stopLossController;
  late TextEditingController _takeProfitController;
  late TextEditingController _setupController;
  late TextEditingController _costsController;
  late TextEditingController _notesController;
  late TextEditingController _mistakesController;

  String _selectedStrategy = 'Breakout';
  String? _selectedSession;
  String? _selectedTimeframe;
  String? _screenshotPath;
  bool _ruleFollowed = true;

  @override
  void initState() {
    super.initState();
    final t = widget.initialTrade;

    _tradeDate = t?.tradeDate ?? DateTime.now();
    _market = t?.market ?? MarketType.nse;
    _direction = t?.direction ?? TradeDirection.buy;

    _symbolController = TextEditingController(text: t?.symbol ?? 'RELIANCE');
    _entryPriceController = TextEditingController(
      text: t != null ? t.entryPrice.toString() : '2850.00',
    );
    _exitPriceController = TextEditingController(
      text: t?.exitPrice != null ? t!.exitPrice.toString() : '2920.00',
    );
    _quantityController = TextEditingController(
      text: t != null ? t.quantity.toString() : '10',
    );
    _stopLossController = TextEditingController(
      text: t?.stopLoss != null ? t!.stopLoss.toString() : '2800.00',
    );
    _takeProfitController = TextEditingController(
      text: t?.takeProfit != null ? t!.takeProfit.toString() : '2950.00',
    );
    _setupController = TextEditingController(text: t?.setup ?? 'Pullback');
    _costsController = TextEditingController(
      text: t != null ? t.totalCosts.toString() : '50.00',
    );
    _notesController = TextEditingController(text: t?.entryReason ?? '');
    _mistakesController = TextEditingController(text: t?.mistakes ?? '');
    _selectedStrategy = t?.strategy ?? 'Breakout';
    _selectedSession = t?.tradingSession;
    _selectedTimeframe = t?.timeframe;
    _screenshotPath = t?.screenshotPath;
    _ruleFollowed = t?.ruleFollowed ?? true;
  }

  @override
  void dispose() {
    _symbolController.dispose();
    _entryPriceController.dispose();
    _exitPriceController.dispose();
    _quantityController.dispose();
    _stopLossController.dispose();
    _takeProfitController.dispose();
    _setupController.dispose();
    _costsController.dispose();
    _notesController.dispose();
    _mistakesController.dispose();
    super.dispose();
  }

  // Live Calculations
  double get _grossPnL {
    final entry = double.tryParse(_entryPriceController.text.trim()) ?? 0.0;
    final exit = double.tryParse(_exitPriceController.text.trim());
    final qty = double.tryParse(_quantityController.text.trim()) ?? 0.0;
    final multiplier = _market == MarketType.forex ? 1000.0 : 1.0;

    return TradingCalculationEngine.calculateGrossPnL(
      direction: _direction,
      entryPrice: entry,
      exitPrice: exit,
      quantity: qty,
      contractMultiplier: multiplier,
    );
  }

  double get _totalCosts {
    return double.tryParse(_costsController.text.trim()) ?? 0.0;
  }

  double get _netPnL {
    if (_exitPriceController.text.trim().isEmpty) return 0.0;
    return TradingCalculationEngine.calculateNetPnL(
      grossPnL: _grossPnL,
      totalCosts: _totalCosts,
    );
  }

  double? get _riskRewardRatio {
    final entry = double.tryParse(_entryPriceController.text.trim()) ?? 0.0;
    final sl = double.tryParse(_stopLossController.text.trim());
    final tp = double.tryParse(_takeProfitController.text.trim());
    final qty = double.tryParse(_quantityController.text.trim()) ?? 0.0;
    final multiplier = _market == MarketType.forex ? 1000.0 : 1.0;

    return TradingCalculationEngine.calculateRiskRewardRatio(
      direction: _direction,
      entryPrice: entry,
      stopLoss: sl,
      takeProfit: tp,
      quantity: qty,
      contractMultiplier: multiplier,
    );
  }

  double? get _rMultiple {
    final entry = double.tryParse(_entryPriceController.text.trim()) ?? 0.0;
    final sl = double.tryParse(_stopLossController.text.trim());
    final qty = double.tryParse(_quantityController.text.trim()) ?? 0.0;
    final multiplier = _market == MarketType.forex ? 1000.0 : 1.0;

    return TradingCalculationEngine.calculateRMultiple(
      netPnL: _netPnL,
      direction: _direction,
      entryPrice: entry,
      stopLoss: sl,
      quantity: qty,
      contractMultiplier: multiplier,
    );
  }

  void _saveTrade() async {
    if (!_formKey.currentState!.validate()) return;

    final symbol = _symbolController.text.trim().toUpperCase();
    final entryPrice =
        double.tryParse(_entryPriceController.text.trim()) ?? 0.0;
    final exitPriceText = _exitPriceController.text.trim();
    final exitPrice = exitPriceText.isNotEmpty
        ? double.tryParse(exitPriceText)
        : null;
    final quantity = double.tryParse(_quantityController.text.trim()) ?? 1.0;
    final stopLoss = double.tryParse(_stopLossController.text.trim());
    final takeProfit = double.tryParse(_takeProfitController.text.trim());
    final multiplier = _market == MarketType.forex ? 1000.0 : 1.0;

    final status = exitPrice != null ? TradeStatus.closed : TradeStatus.open;
    final outcome = TradingCalculationEngine.determineOutcome(
      status: status,
      exitPrice: exitPrice,
      netPnL: _netPnL,
    );

    final now = DateTime.now();
    final trade = TradeModel(
      id: widget.initialTrade?.id ?? const Uuid().v4(),
      tradeDate: _tradeDate,
      symbol: symbol,
      market: _market,
      direction: _direction,
      entryPrice: entryPrice,
      exitPrice: exitPrice,
      quantity: quantity,
      contractMultiplier: multiplier,
      strategy: _selectedStrategy,
      setup: _setupController.text.trim().isNotEmpty
          ? _setupController.text.trim()
          : null,
      stopLoss: stopLoss,
      takeProfit: takeProfit,
      tradingSession: _selectedSession,
      timeframe: _selectedTimeframe,
      totalCosts: _totalCosts,
      grossPnL: _grossPnL,
      netPnL: _netPnL,
      riskRewardRatio: _riskRewardRatio,
      rMultiple: _rMultiple,
      status: status,
      outcome: outcome,
      entryReason: _notesController.text.trim().isNotEmpty
          ? _notesController.text.trim()
          : null,
      mistakes: _mistakesController.text.trim().isNotEmpty
          ? _mistakesController.text.trim()
          : null,
      ruleFollowed: _ruleFollowed,
      screenshotPath: _screenshotPath,
      createdAt: widget.initialTrade?.createdAt ?? now,
      updatedAt: now,
    );

    final repo = ref.read(tradeRepositoryProvider);
    if (widget.initialTrade != null) {
      await repo.updateTrade(trade);
      if (mounted) {
        AppDialogs.showSnackBar(context, 'Trade updated successfully');
      }
    } else {
      await repo.insertTrade(trade);
      if (mounted) {
        AppDialogs.showSnackBar(context, 'Trade saved successfully');
      }
    }

    if (mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final currencySymbol = settings.currencySymbol;
    final strategies = ref.watch(allStrategiesStreamProvider).value ?? [];

    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(
        title: Text(widget.initialTrade != null ? 'Edit Trade' : 'Add Trade'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryGold),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          onChanged: () => setState(() {}),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Trade Date Selector
                _buildFieldLabel('Trade Date'),
                GestureDetector(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _tradeDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.dark().copyWith(
                            colorScheme: const ColorScheme.dark(
                              primary: AppColors.primaryGold,
                              onPrimary: AppColors.mainBackground,
                              surface: AppColors.cardBackground,
                              onSurface: AppColors.primaryText,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null) {
                      setState(() => _tradeDate = picked);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.goldBorder.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateTimeUtils.formatTradeDate(_tradeDate),
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 15,
                          ),
                        ),
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 18,
                          color: AppColors.primaryGold,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Symbol
                _buildFieldLabel('Symbol'),
                TextFormField(
                  controller: _symbolController,
                  textCapitalization: TextCapitalization.characters,
                  style: const TextStyle(color: AppColors.primaryText),
                  decoration: const InputDecoration(
                    hintText: 'e.g. RELIANCE or GBPUSD',
                  ),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return 'Symbol is required';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Market (NSE | Forex)
                _buildFieldLabel('Market'),
                Row(
                  children: [
                    Expanded(
                      child: _buildTogglePill(
                        label: 'NSE',
                        isSelected: _market == MarketType.nse,
                        onTap: () => setState(() => _market = MarketType.nse),
                        selectedColor: AppColors.primaryGold,
                        selectedTextColor: AppColors.mainBackground,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildTogglePill(
                        label: 'Forex',
                        isSelected: _market == MarketType.forex,
                        onTap: () => setState(() => _market = MarketType.forex),
                        selectedColor: AppColors.primaryGold,
                        selectedTextColor: AppColors.mainBackground,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Direction (Buy | Sell)
                _buildFieldLabel('Direction'),
                Row(
                  children: [
                    Expanded(
                      child: _buildTogglePill(
                        label: 'Buy',
                        isSelected: _direction == TradeDirection.buy,
                        onTap: () =>
                            setState(() => _direction = TradeDirection.buy),
                        selectedColor: AppColors.profitGreen,
                        selectedTextColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildTogglePill(
                        label: 'Sell',
                        isSelected: _direction == TradeDirection.sell,
                        onTap: () =>
                            setState(() => _direction = TradeDirection.sell),
                        selectedColor: AppColors.lossRed,
                        selectedTextColor: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Entry Price & Exit Price
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFieldLabel('Entry Price'),
                          TextFormField(
                            controller: _entryPriceController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            style: const TextStyle(
                              color: AppColors.primaryText,
                            ),
                            decoration: const InputDecoration(hintText: '0.00'),
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return 'Required';
                              }
                              final n = double.tryParse(val.trim());
                              if (n == null || n <= 0) return 'Invalid price';
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFieldLabel('Exit Price'),
                          TextFormField(
                            controller: _exitPriceController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            style: const TextStyle(
                              color: AppColors.primaryText,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Optional for open',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Quantity
                _buildFieldLabel('Quantity'),
                TextFormField(
                  controller: _quantityController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  style: const TextStyle(color: AppColors.primaryText),
                  decoration: InputDecoration(
                    hintText: _market == MarketType.forex
                        ? 'Lots (e.g. 1.0)'
                        : 'Shares (e.g. 10)',
                  ),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return 'Required';
                    final n = double.tryParse(val.trim());
                    if (n == null || n <= 0) return 'Invalid qty';
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Strategy Dropdown
                _buildFieldLabel('Strategy'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.goldBorder.withValues(alpha: 0.3),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: strategies.any((s) => s.name == _selectedStrategy)
                          ? _selectedStrategy
                          : (strategies.isNotEmpty
                                ? strategies.first.name
                                : 'Breakout'),
                      isExpanded: true,
                      dropdownColor: AppColors.cardBackground,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.primaryGold,
                      ),
                      items:
                          (strategies.isNotEmpty
                                  ? strategies.map((s) => s.name).toList()
                                  : [
                                      'Breakout',
                                      'Pullback',
                                      'Scalping',
                                      'News Trade',
                                      'Trend Reversal',
                                    ])
                              .map(
                                (name) => DropdownMenuItem(
                                  value: name,
                                  child: Text(
                                    name,
                                    style: const TextStyle(
                                      color: AppColors.primaryText,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() => _selectedStrategy = val);
                        }
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Setup
                _buildFieldLabel('Setup'),
                TextFormField(
                  controller: _setupController,
                  style: const TextStyle(color: AppColors.primaryText),
                  decoration: const InputDecoration(
                    hintText: 'e.g. Pullback, Double Top, Range Break',
                  ),
                ),

                const SizedBox(height: 16),

                // Stop Loss & Take Profit
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFieldLabel('Stop Loss (optional)'),
                          TextFormField(
                            controller: _stopLossController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            style: const TextStyle(
                              color: AppColors.primaryText,
                            ),
                            decoration: const InputDecoration(hintText: '0.00'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFieldLabel('Take Profit (optional)'),
                          TextFormField(
                            controller: _takeProfitController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            style: const TextStyle(
                              color: AppColors.primaryText,
                            ),
                            decoration: const InputDecoration(hintText: '0.00'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Total Costs / Brokerage
                _buildFieldLabel('Total Trading Costs / Brokerage'),
                TextFormField(
                  controller: _costsController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  style: const TextStyle(color: AppColors.primaryText),
                  decoration: const InputDecoration(hintText: '50.00'),
                ),

                const SizedBox(height: 16),

                // Screenshot Picker
                _buildFieldLabel('Trade Screenshot (optional)'),
                GestureDetector(
                  onTap: () async {
                    final picker = ImagePicker();
                    final image = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (image != null) {
                      setState(() => _screenshotPath = image.path);
                    }
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.goldBorder.withValues(alpha: 0.3),
                      ),
                    ),
                    child: _screenshotPath != null
                        ? Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  File(_screenshotPath!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 6,
                                right: 6,
                                child: GestureDetector(
                                  onTap: () =>
                                      setState(() => _screenshotPath = null),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_photo_alternate_outlined,
                                color: AppColors.primaryGold,
                                size: 28,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Tap to attach chart screenshot',
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),

                const SizedBox(height: 24),

                // Live Calculation Panel (exact match to reference screenshot)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.goldBorder.withValues(alpha: 0.35),
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildCalcRow(
                        'Gross P&L',
                        CurrencyFormatter.format(
                          _grossPnL,
                          currencySymbol: currencySymbol,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildCalcRow(
                        'Total Costs',
                        CurrencyFormatter.format(
                          _totalCosts,
                          currencySymbol: currencySymbol,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(color: AppColors.divider),
                      ),
                      _buildCalcRow(
                        'Net P&L',
                        CurrencyFormatter.format(
                          _netPnL,
                          currencySymbol: currencySymbol,
                          showSign: true,
                        ),
                        isBold: true,
                        valueColor: _netPnL >= 0
                            ? AppColors.profitGreen
                            : AppColors.lossRed,
                        fontSize: 18,
                      ),
                      if (_riskRewardRatio != null) ...[
                        const SizedBox(height: 6),
                        _buildCalcRow(
                          'Risk / Reward',
                          CurrencyFormatter.formatRatio(_riskRewardRatio),
                        ),
                      ],
                      if (_rMultiple != null) ...[
                        const SizedBox(height: 6),
                        _buildCalcRow(
                          'R Multiple',
                          CurrencyFormatter.formatRMultiple(_rMultiple),
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Prominent Gold Save Button
                GoldButton(
                  text: widget.initialTrade != null
                      ? 'Update Trade'
                      : 'Save Trade',
                  height: 52,
                  borderRadius: 26,
                  onPressed: _saveTrade,
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.secondaryText,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTogglePill({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required Color selectedColor,
    required Color selectedTextColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : AppColors.inputBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? selectedColor
                : AppColors.goldBorder.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? selectedTextColor : AppColors.secondaryText,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCalcRow(
    String label,
    String value, {
    bool isBold = false,
    Color? valueColor,
    double fontSize = 14,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.secondaryText,
            fontSize: fontSize,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? AppColors.primaryText,
            fontSize: fontSize,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
