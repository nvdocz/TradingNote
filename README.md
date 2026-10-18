# TradeTrack Journal

**TradeTrack Journal** is a high-performance, offline-first mobile and desktop trading journal engineered for equity (NSE/BSE), commodity (MCX), forex, and crypto traders. Built using Flutter, Riverpod, Drift (SQLite), and FL Chart with a dark luxury gold design system.

---

## 🌟 Key Features

### 📊 1. Executive Performance Dashboard
- **Financial Metrics**: Real-time calculated Net P&L, Total Return %, Win Rate, Profit Factor, and Total Closed Trades.
- **Dynamic Equity Curve**: Interactive cumulative P&L chart with smooth spline curves and baseline markers.
- **Daily Performance Histogram**: Color-coded daily profit/loss bar chart.
- **Date Range Filtering**: Flexible filtering across *Today*, *This Week*, *This Month*, *Last 30 Days*, *Last 3 Months*, *This Year*, *All Time*, and *Custom Date Range*.

### 📖 2. Trade Journal
- **Search & Multi-Filter**: Real-time symbol search with Market filter pills (*All*, *NSE*, *Forex*) and multi-dimensional filter sheet (*Strategy*, *Outcome*, *Status*).
- **Rich Trade Cards**: Highlights Net P&L, Risk/Reward (R:R), R-Multiple (+X.XR), trading session, setup notes, rule compliance indicators, and screenshot attachments.
- **Swipe & Quick Actions**: Fast navigation to full trade breakdown, editing, and deletion.

### ✍️ 3. Full Trade Logging & Auto-Calculation Engine
- **Position Mechanics**: Long (Buy) and Short (Sell) execution models with custom contract multipliers for Futures, Options, and Forex lot sizes.
- **Real-Time Financial Formulas**:
  - Gross P&L: `(Exit Price - Entry Price) × Quantity × Multiplier`
  - Total Friction Costs: `Brokerage + Exchange Fees + Spread + Other`
  - Net P&L: `Gross P&L - Total Costs`
  - Planned Risk & Reward: Auto-calculated monetary risk/reward from Stop Loss and Take Profit
  - Risk-to-Reward Ratio ($R:R$) & $R$-Multiple realization
- **Psychological Tracking**: Pre-trade and post-trade emotions, discipline check (*Rule Followed* switch), mistake categorization, and lessons learned.
- **Visual Chart Attachments**: Attach chart screenshots from device gallery or camera.

### 📈 4. Advanced Analytics & Strategy Breakdown
- **Timeframe Aggregation**: Switch between 1M, 3M, 6M, 1Y, and All-Time performance.
- **Win / Loss / Breakeven Donut Chart**: Proportional breakdown of trade results with count and percentage stats.
- **Strategy Leaderboard**: Net P&L, Win Rate, and trade volume breakdown per strategy.
- **Core Statistics**: Average Winner, Average Loser, Expectancy per trade, Maximum Drawdown (monetary & percentage).

### 🗓️ 5. Daily Review & Calendar Heatmap
- **Monthly P&L Heatmap**: Interactive visual calendar with green/red profit-and-loss indicators for each trading day.
- **Daily Journaling**: Star-rated discipline score (1–5), mindset reflections, mistake logging, and key takeaways.
- **Day-by-Day Trade Listing**: Instant recall of all orders filled on that trading session.

### ⚙️ 6. Strategy Management & Data Freedom
- **Strategy Customizer**: Color-coded strategy tags with market assignment and active/archived statuses.
- **Local Data Storage**: Zero cloud dependency; 100% private SQLite database stored securely on the local device.
- **Export & Backup**: One-click export to CSV (spreadsheet-compatible) and full JSON backup with share sheet integration.
- **Import & Restore**: Restore previous backups or reseed sample demo data anytime.

---

## 🛠️ Tech Stack & Architecture

- **UI Framework**: [Flutter](https://flutter.dev) (Dart 3.x)
- **State Management**: [Riverpod 2.6+](https://riverpod.dev) (`flutter_riverpod`)
- **Local Database**: [Drift](https://drift.simonbinder.eu) (Type-safe SQLite persistence with migrations and streams)
- **Routing**: [GoRouter 18+](https://pub.dev/packages/go_router) with indexed stack branch routing
- **Charts**: [FL Chart 1.2+](https://pub.dev/packages/fl_chart)
- **Typography & Theme**: Google Fonts (*Outfit* / *JetBrains Mono* / *Inter*) with gold-on-onyx dark theme (`AppColors`)

```
lib/
├── core/
│   ├── constants/       # AppColors, typography tokens
│   ├── providers/       # Riverpod providers & state notifiers
│   ├── router/          # GoRouter declaration & route paths
│   ├── theme/           # Dark gold theme ThemeData configuration
│   └── utils/           # CurrencyFormatter, DateTimeUtils
├── data/
│   ├── database/        # Drift database tables, DAOs & generated schema
│   ├── repositories/    # Trade, Strategy, Review, Settings repositories
│   └── seed/            # Demo sample data seeder
├── domain/
│   ├── engine/          # Pure Dart TradingCalculationEngine
│   └── models/          # TradeModel, StrategyModel, DailyReviewModel, etc.
├── features/
│   ├── analytics/       # AnalyticsScreen & distribution charts
│   ├── daily_review/    # DailyReviewScreen & calendar heatmap
│   ├── dashboard/       # DashboardScreen & metric cards
│   ├── journal/         # TradeJournalScreen & filtering
│   ├── navigation/      # MainScaffold with custom bottom navigation
│   ├── onboarding/      # OnboardingScreen
│   ├── profile_settings/# ProfileSettingsScreen & CSV/JSON export
│   ├── splash/          # SplashScreen
│   ├── strategies/      # StrategyManagerScreen
│   ├── trade_details/   # TradeDetailsScreen
│   └── trade_form/      # AddTradeScreen & validation
└── shared/
    └── widgets/         # Reusable buttons, cards, badges, dialogs
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>= 3.13.5)
- Android SDK or iOS Xcode (for mobile) / Visual Studio (for Windows desktop)

### Installation

1. **Clone or navigate to the repository:**
   ```bash
   cd TradingNote
   ```

2. **Install Flutter dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run code generation (if modifying Drift schemas):**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run test suite:**
   ```bash
   flutter test
   ```

5. **Run the application:**
   ```bash
   flutter run
   ```

---

## 🧪 Testing

The repository contains a test suite covering calculation algorithms, SQLite integration, utility formatters, and UI widgets:

```bash
flutter test
```

- `test/trading_calculation_engine_test.dart`: P&L calculation, fees, risk/reward, R-multiples, expectancy, drawdown, profit factor edge cases.
- `test/database_test.dart`: In-memory Drift SQLite integration testing for trades, strategies, daily reviews, and batch operations.
- `test/utils_test.dart`: Currency formatting, compact Indian numbering (Lakhs, Crores, K), and date utilities.
- `test/widget_test.dart`: Core widget testing for buttons, metrics cards, and status badges.

---

## 🔒 Privacy & Security

All trades, journals, emotional notes, and statistics are stored exclusively in an on-device SQLite database. No analytics trackers, external servers, or cloud dependencies exist.
