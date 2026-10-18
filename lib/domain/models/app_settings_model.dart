import 'trade_enums.dart';

class AppSettingsModel {
  final String currencySymbol;
  final String currencyCode;
  final MarketType defaultMarket;
  final double startingCapital;
  final double dailyGoal;
  final double weeklyGoal;
  final String userName;
  final bool hasCompletedOnboarding;
  final List<String> accounts;
  final List<String> tags;
  final List<String> symbols;

  const AppSettingsModel({
    this.currencySymbol = '₹',
    this.currencyCode = 'INR',
    this.defaultMarket = MarketType.nse,
    this.startingCapital = 100000.0,
    this.dailyGoal = 2000.0,
    this.weeklyGoal = 10000.0,
    this.userName = 'Trader',
    this.hasCompletedOnboarding = false,
    this.accounts = const ['Main Account', 'Scalp Account'],
    this.tags = const [
      'A+ Setup',
      'Trend Following',
      'Range Bound',
      'Earnings Play',
      'News',
    ],
    this.symbols = const [
      'RELIANCE',
      'TCS',
      'HDFCBANK',
      'INFY',
      'GBPUSD',
      'EURUSD',
      'USDJPY',
      'NIFTY',
      'BANKNIFTY',
    ],
  });

  AppSettingsModel copyWith({
    String? currencySymbol,
    String? currencyCode,
    MarketType? defaultMarket,
    double? startingCapital,
    double? dailyGoal,
    double? weeklyGoal,
    String? userName,
    bool? hasCompletedOnboarding,
    List<String>? accounts,
    List<String>? tags,
    List<String>? symbols,
  }) {
    return AppSettingsModel(
      currencySymbol: currencySymbol ?? this.currencySymbol,
      currencyCode: currencyCode ?? this.currencyCode,
      defaultMarket: defaultMarket ?? this.defaultMarket,
      startingCapital: startingCapital ?? this.startingCapital,
      dailyGoal: dailyGoal ?? this.dailyGoal,
      weeklyGoal: weeklyGoal ?? this.weeklyGoal,
      userName: userName ?? this.userName,
      hasCompletedOnboarding:
          hasCompletedOnboarding ?? this.hasCompletedOnboarding,
      accounts: accounts ?? this.accounts,
      tags: tags ?? this.tags,
      symbols: symbols ?? this.symbols,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currencySymbol': currencySymbol,
      'currencyCode': currencyCode,
      'defaultMarket': defaultMarket.name,
      'startingCapital': startingCapital,
      'dailyGoal': dailyGoal,
      'weeklyGoal': weeklyGoal,
      'userName': userName,
      'hasCompletedOnboarding': hasCompletedOnboarding,
      'accounts': accounts,
      'tags': tags,
      'symbols': symbols,
    };
  }

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) {
    return AppSettingsModel(
      currencySymbol: json['currencySymbol'] as String? ?? '₹',
      currencyCode: json['currencyCode'] as String? ?? 'INR',
      defaultMarket: MarketType.fromString(
        json['defaultMarket'] as String? ?? 'nse',
      ),
      startingCapital:
          (json['startingCapital'] as num?)?.toDouble() ?? 100000.0,
      dailyGoal: (json['dailyGoal'] as num?)?.toDouble() ?? 2000.0,
      weeklyGoal: (json['weeklyGoal'] as num?)?.toDouble() ?? 10000.0,
      userName: json['userName'] as String? ?? 'Trader',
      hasCompletedOnboarding: json['hasCompletedOnboarding'] as bool? ?? false,
      accounts:
          (json['accounts'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const ['Main Account', 'Scalp Account'],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
          const [
            'A+ Setup',
            'Trend Following',
            'Range Bound',
            'Earnings Play',
            'News',
          ],
      symbols:
          (json['symbols'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [
            'RELIANCE',
            'TCS',
            'HDFCBANK',
            'INFY',
            'GBPUSD',
            'EURUSD',
            'USDJPY',
            'NIFTY',
            'BANKNIFTY',
          ],
    );
  }
}
