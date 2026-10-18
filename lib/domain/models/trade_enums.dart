enum MarketType {
  nse('NSE', 'National Stock Exchange (India)'),
  forex('Forex', 'Foreign Exchange Currency Market');

  final String label;
  final String description;
  const MarketType(this.label, this.description);

  static MarketType fromString(String val) {
    return MarketType.values.firstWhere(
      (e) =>
          e.name.toLowerCase() == val.toLowerCase() ||
          e.label.toLowerCase() == val.toLowerCase(),
      orElse: () => MarketType.nse,
    );
  }
}

enum TradeDirection {
  buy('Buy', 'Long Position'),
  sell('Sell', 'Short Position');

  final String label;
  final String description;
  const TradeDirection(this.label, this.description);

  static TradeDirection fromString(String val) {
    return TradeDirection.values.firstWhere(
      (e) =>
          e.name.toLowerCase() == val.toLowerCase() ||
          e.label.toLowerCase() == val.toLowerCase(),
      orElse: () => TradeDirection.buy,
    );
  }
}

enum TradeStatus {
  open('Open'),
  closed('Closed');

  final String label;
  const TradeStatus(this.label);

  static TradeStatus fromString(String val) {
    return TradeStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == val.toLowerCase(),
      orElse: () => TradeStatus.closed,
    );
  }
}

enum TradeOutcome {
  win('Win'),
  loss('Loss'),
  breakeven('Breakeven'),
  open('Open');

  final String label;
  const TradeOutcome(this.label);
}

enum DateRangeFilter {
  today('Today'),
  thisWeek('This Week'),
  thisMonth('This Month'),
  last30Days('Last 30 Days'),
  last3Months('Last 3 Months'),
  thisYear('This Year'),
  allTime('All Time'),
  custom('Custom');

  final String label;
  const DateRangeFilter(this.label);
}
