// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TradesTableTable extends TradesTable
    with TableInfo<$TradesTableTable, TradesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TradesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tradeDateMeta = const VerificationMeta(
    'tradeDate',
  );
  @override
  late final GeneratedColumn<DateTime> tradeDate = GeneratedColumn<DateTime>(
    'trade_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
    'symbol',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _marketMeta = const VerificationMeta('market');
  @override
  late final GeneratedColumn<String> market = GeneratedColumn<String>(
    'market',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _directionMeta = const VerificationMeta(
    'direction',
  );
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
    'direction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entryPriceMeta = const VerificationMeta(
    'entryPrice',
  );
  @override
  late final GeneratedColumn<double> entryPrice = GeneratedColumn<double>(
    'entry_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exitPriceMeta = const VerificationMeta(
    'exitPrice',
  );
  @override
  late final GeneratedColumn<double> exitPrice = GeneratedColumn<double>(
    'exit_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contractMultiplierMeta =
      const VerificationMeta('contractMultiplier');
  @override
  late final GeneratedColumn<double> contractMultiplier =
      GeneratedColumn<double>(
        'contract_multiplier',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(1.0),
      );
  static const VerificationMeta _strategyMeta = const VerificationMeta(
    'strategy',
  );
  @override
  late final GeneratedColumn<String> strategy = GeneratedColumn<String>(
    'strategy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _setupMeta = const VerificationMeta('setup');
  @override
  late final GeneratedColumn<String> setup = GeneratedColumn<String>(
    'setup',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stopLossMeta = const VerificationMeta(
    'stopLoss',
  );
  @override
  late final GeneratedColumn<double> stopLoss = GeneratedColumn<double>(
    'stop_loss',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _takeProfitMeta = const VerificationMeta(
    'takeProfit',
  );
  @override
  late final GeneratedColumn<double> takeProfit = GeneratedColumn<double>(
    'take_profit',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entryTimeMeta = const VerificationMeta(
    'entryTime',
  );
  @override
  late final GeneratedColumn<String> entryTime = GeneratedColumn<String>(
    'entry_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exitTimeMeta = const VerificationMeta(
    'exitTime',
  );
  @override
  late final GeneratedColumn<String> exitTime = GeneratedColumn<String>(
    'exit_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tradingSessionMeta = const VerificationMeta(
    'tradingSession',
  );
  @override
  late final GeneratedColumn<String> tradingSession = GeneratedColumn<String>(
    'trading_session',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timeframeMeta = const VerificationMeta(
    'timeframe',
  );
  @override
  late final GeneratedColumn<String> timeframe = GeneratedColumn<String>(
    'timeframe',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _brokerageMeta = const VerificationMeta(
    'brokerage',
  );
  @override
  late final GeneratedColumn<double> brokerage = GeneratedColumn<double>(
    'brokerage',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _exchangeFeesMeta = const VerificationMeta(
    'exchangeFees',
  );
  @override
  late final GeneratedColumn<double> exchangeFees = GeneratedColumn<double>(
    'exchange_fees',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _spreadCommissionMeta = const VerificationMeta(
    'spreadCommission',
  );
  @override
  late final GeneratedColumn<double> spreadCommission = GeneratedColumn<double>(
    'spread_commission',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _otherCostsMeta = const VerificationMeta(
    'otherCosts',
  );
  @override
  late final GeneratedColumn<double> otherCosts = GeneratedColumn<double>(
    'other_costs',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _totalCostsMeta = const VerificationMeta(
    'totalCosts',
  );
  @override
  late final GeneratedColumn<double> totalCosts = GeneratedColumn<double>(
    'total_costs',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _grossPnLMeta = const VerificationMeta(
    'grossPnL',
  );
  @override
  late final GeneratedColumn<double> grossPnL = GeneratedColumn<double>(
    'gross_pn_l',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _netPnLMeta = const VerificationMeta('netPnL');
  @override
  late final GeneratedColumn<double> netPnL = GeneratedColumn<double>(
    'net_pn_l',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _riskRewardRatioMeta = const VerificationMeta(
    'riskRewardRatio',
  );
  @override
  late final GeneratedColumn<double> riskRewardRatio = GeneratedColumn<double>(
    'risk_reward_ratio',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rMultipleMeta = const VerificationMeta(
    'rMultiple',
  );
  @override
  late final GeneratedColumn<double> rMultiple = GeneratedColumn<double>(
    'r_multiple',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _outcomeMeta = const VerificationMeta(
    'outcome',
  );
  @override
  late final GeneratedColumn<String> outcome = GeneratedColumn<String>(
    'outcome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountMeta = const VerificationMeta(
    'account',
  );
  @override
  late final GeneratedColumn<String> account = GeneratedColumn<String>(
    'account',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Main Account'),
  );
  static const VerificationMeta _entryReasonMeta = const VerificationMeta(
    'entryReason',
  );
  @override
  late final GeneratedColumn<String> entryReason = GeneratedColumn<String>(
    'entry_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exitReasonMeta = const VerificationMeta(
    'exitReason',
  );
  @override
  late final GeneratedColumn<String> exitReason = GeneratedColumn<String>(
    'exit_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emotionalStateMeta = const VerificationMeta(
    'emotionalState',
  );
  @override
  late final GeneratedColumn<String> emotionalState = GeneratedColumn<String>(
    'emotional_state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ruleFollowedMeta = const VerificationMeta(
    'ruleFollowed',
  );
  @override
  late final GeneratedColumn<bool> ruleFollowed = GeneratedColumn<bool>(
    'rule_followed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("rule_followed" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _mistakesMeta = const VerificationMeta(
    'mistakes',
  );
  @override
  late final GeneratedColumn<String> mistakes = GeneratedColumn<String>(
    'mistakes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lessonsLearnedMeta = const VerificationMeta(
    'lessonsLearned',
  );
  @override
  late final GeneratedColumn<String> lessonsLearned = GeneratedColumn<String>(
    'lessons_learned',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsJsonMeta = const VerificationMeta(
    'tagsJson',
  );
  @override
  late final GeneratedColumn<String> tagsJson = GeneratedColumn<String>(
    'tags_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _screenshotPathMeta = const VerificationMeta(
    'screenshotPath',
  );
  @override
  late final GeneratedColumn<String> screenshotPath = GeneratedColumn<String>(
    'screenshot_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tradeDate,
    symbol,
    market,
    direction,
    entryPrice,
    exitPrice,
    quantity,
    contractMultiplier,
    strategy,
    setup,
    stopLoss,
    takeProfit,
    entryTime,
    exitTime,
    tradingSession,
    timeframe,
    brokerage,
    exchangeFees,
    spreadCommission,
    otherCosts,
    totalCosts,
    grossPnL,
    netPnL,
    riskRewardRatio,
    rMultiple,
    status,
    outcome,
    account,
    entryReason,
    exitReason,
    emotionalState,
    ruleFollowed,
    mistakes,
    lessonsLearned,
    tagsJson,
    screenshotPath,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trades_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TradesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('trade_date')) {
      context.handle(
        _tradeDateMeta,
        tradeDate.isAcceptableOrUnknown(data['trade_date']!, _tradeDateMeta),
      );
    } else if (isInserting) {
      context.missing(_tradeDateMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(
        _symbolMeta,
        symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta),
      );
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('market')) {
      context.handle(
        _marketMeta,
        market.isAcceptableOrUnknown(data['market']!, _marketMeta),
      );
    } else if (isInserting) {
      context.missing(_marketMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(
        _directionMeta,
        direction.isAcceptableOrUnknown(data['direction']!, _directionMeta),
      );
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('entry_price')) {
      context.handle(
        _entryPriceMeta,
        entryPrice.isAcceptableOrUnknown(data['entry_price']!, _entryPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_entryPriceMeta);
    }
    if (data.containsKey('exit_price')) {
      context.handle(
        _exitPriceMeta,
        exitPrice.isAcceptableOrUnknown(data['exit_price']!, _exitPriceMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('contract_multiplier')) {
      context.handle(
        _contractMultiplierMeta,
        contractMultiplier.isAcceptableOrUnknown(
          data['contract_multiplier']!,
          _contractMultiplierMeta,
        ),
      );
    }
    if (data.containsKey('strategy')) {
      context.handle(
        _strategyMeta,
        strategy.isAcceptableOrUnknown(data['strategy']!, _strategyMeta),
      );
    } else if (isInserting) {
      context.missing(_strategyMeta);
    }
    if (data.containsKey('setup')) {
      context.handle(
        _setupMeta,
        setup.isAcceptableOrUnknown(data['setup']!, _setupMeta),
      );
    }
    if (data.containsKey('stop_loss')) {
      context.handle(
        _stopLossMeta,
        stopLoss.isAcceptableOrUnknown(data['stop_loss']!, _stopLossMeta),
      );
    }
    if (data.containsKey('take_profit')) {
      context.handle(
        _takeProfitMeta,
        takeProfit.isAcceptableOrUnknown(data['take_profit']!, _takeProfitMeta),
      );
    }
    if (data.containsKey('entry_time')) {
      context.handle(
        _entryTimeMeta,
        entryTime.isAcceptableOrUnknown(data['entry_time']!, _entryTimeMeta),
      );
    }
    if (data.containsKey('exit_time')) {
      context.handle(
        _exitTimeMeta,
        exitTime.isAcceptableOrUnknown(data['exit_time']!, _exitTimeMeta),
      );
    }
    if (data.containsKey('trading_session')) {
      context.handle(
        _tradingSessionMeta,
        tradingSession.isAcceptableOrUnknown(
          data['trading_session']!,
          _tradingSessionMeta,
        ),
      );
    }
    if (data.containsKey('timeframe')) {
      context.handle(
        _timeframeMeta,
        timeframe.isAcceptableOrUnknown(data['timeframe']!, _timeframeMeta),
      );
    }
    if (data.containsKey('brokerage')) {
      context.handle(
        _brokerageMeta,
        brokerage.isAcceptableOrUnknown(data['brokerage']!, _brokerageMeta),
      );
    }
    if (data.containsKey('exchange_fees')) {
      context.handle(
        _exchangeFeesMeta,
        exchangeFees.isAcceptableOrUnknown(
          data['exchange_fees']!,
          _exchangeFeesMeta,
        ),
      );
    }
    if (data.containsKey('spread_commission')) {
      context.handle(
        _spreadCommissionMeta,
        spreadCommission.isAcceptableOrUnknown(
          data['spread_commission']!,
          _spreadCommissionMeta,
        ),
      );
    }
    if (data.containsKey('other_costs')) {
      context.handle(
        _otherCostsMeta,
        otherCosts.isAcceptableOrUnknown(data['other_costs']!, _otherCostsMeta),
      );
    }
    if (data.containsKey('total_costs')) {
      context.handle(
        _totalCostsMeta,
        totalCosts.isAcceptableOrUnknown(data['total_costs']!, _totalCostsMeta),
      );
    }
    if (data.containsKey('gross_pn_l')) {
      context.handle(
        _grossPnLMeta,
        grossPnL.isAcceptableOrUnknown(data['gross_pn_l']!, _grossPnLMeta),
      );
    }
    if (data.containsKey('net_pn_l')) {
      context.handle(
        _netPnLMeta,
        netPnL.isAcceptableOrUnknown(data['net_pn_l']!, _netPnLMeta),
      );
    }
    if (data.containsKey('risk_reward_ratio')) {
      context.handle(
        _riskRewardRatioMeta,
        riskRewardRatio.isAcceptableOrUnknown(
          data['risk_reward_ratio']!,
          _riskRewardRatioMeta,
        ),
      );
    }
    if (data.containsKey('r_multiple')) {
      context.handle(
        _rMultipleMeta,
        rMultiple.isAcceptableOrUnknown(data['r_multiple']!, _rMultipleMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('outcome')) {
      context.handle(
        _outcomeMeta,
        outcome.isAcceptableOrUnknown(data['outcome']!, _outcomeMeta),
      );
    } else if (isInserting) {
      context.missing(_outcomeMeta);
    }
    if (data.containsKey('account')) {
      context.handle(
        _accountMeta,
        account.isAcceptableOrUnknown(data['account']!, _accountMeta),
      );
    }
    if (data.containsKey('entry_reason')) {
      context.handle(
        _entryReasonMeta,
        entryReason.isAcceptableOrUnknown(
          data['entry_reason']!,
          _entryReasonMeta,
        ),
      );
    }
    if (data.containsKey('exit_reason')) {
      context.handle(
        _exitReasonMeta,
        exitReason.isAcceptableOrUnknown(data['exit_reason']!, _exitReasonMeta),
      );
    }
    if (data.containsKey('emotional_state')) {
      context.handle(
        _emotionalStateMeta,
        emotionalState.isAcceptableOrUnknown(
          data['emotional_state']!,
          _emotionalStateMeta,
        ),
      );
    }
    if (data.containsKey('rule_followed')) {
      context.handle(
        _ruleFollowedMeta,
        ruleFollowed.isAcceptableOrUnknown(
          data['rule_followed']!,
          _ruleFollowedMeta,
        ),
      );
    }
    if (data.containsKey('mistakes')) {
      context.handle(
        _mistakesMeta,
        mistakes.isAcceptableOrUnknown(data['mistakes']!, _mistakesMeta),
      );
    }
    if (data.containsKey('lessons_learned')) {
      context.handle(
        _lessonsLearnedMeta,
        lessonsLearned.isAcceptableOrUnknown(
          data['lessons_learned']!,
          _lessonsLearnedMeta,
        ),
      );
    }
    if (data.containsKey('tags_json')) {
      context.handle(
        _tagsJsonMeta,
        tagsJson.isAcceptableOrUnknown(data['tags_json']!, _tagsJsonMeta),
      );
    }
    if (data.containsKey('screenshot_path')) {
      context.handle(
        _screenshotPathMeta,
        screenshotPath.isAcceptableOrUnknown(
          data['screenshot_path']!,
          _screenshotPathMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TradesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TradesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      tradeDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}trade_date'],
      )!,
      symbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symbol'],
      )!,
      market: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}market'],
      )!,
      direction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direction'],
      )!,
      entryPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}entry_price'],
      )!,
      exitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}exit_price'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      contractMultiplier: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}contract_multiplier'],
      )!,
      strategy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}strategy'],
      )!,
      setup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}setup'],
      ),
      stopLoss: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}stop_loss'],
      ),
      takeProfit: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}take_profit'],
      ),
      entryTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entry_time'],
      ),
      exitTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exit_time'],
      ),
      tradingSession: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trading_session'],
      ),
      timeframe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timeframe'],
      ),
      brokerage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}brokerage'],
      )!,
      exchangeFees: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}exchange_fees'],
      )!,
      spreadCommission: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}spread_commission'],
      )!,
      otherCosts: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}other_costs'],
      )!,
      totalCosts: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_costs'],
      )!,
      grossPnL: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gross_pn_l'],
      )!,
      netPnL: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}net_pn_l'],
      )!,
      riskRewardRatio: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}risk_reward_ratio'],
      ),
      rMultiple: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}r_multiple'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      outcome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outcome'],
      )!,
      account: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account'],
      )!,
      entryReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entry_reason'],
      ),
      exitReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exit_reason'],
      ),
      emotionalState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emotional_state'],
      ),
      ruleFollowed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}rule_followed'],
      )!,
      mistakes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mistakes'],
      ),
      lessonsLearned: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lessons_learned'],
      ),
      tagsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags_json'],
      )!,
      screenshotPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}screenshot_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $TradesTableTable createAlias(String alias) {
    return $TradesTableTable(attachedDatabase, alias);
  }
}

class TradesTableData extends DataClass implements Insertable<TradesTableData> {
  final String id;
  final DateTime tradeDate;
  final String symbol;
  final String market;
  final String direction;
  final double entryPrice;
  final double? exitPrice;
  final double quantity;
  final double contractMultiplier;
  final String strategy;
  final String? setup;
  final double? stopLoss;
  final double? takeProfit;
  final String? entryTime;
  final String? exitTime;
  final String? tradingSession;
  final String? timeframe;
  final double brokerage;
  final double exchangeFees;
  final double spreadCommission;
  final double otherCosts;
  final double totalCosts;
  final double grossPnL;
  final double netPnL;
  final double? riskRewardRatio;
  final double? rMultiple;
  final String status;
  final String outcome;
  final String account;
  final String? entryReason;
  final String? exitReason;
  final String? emotionalState;
  final bool ruleFollowed;
  final String? mistakes;
  final String? lessonsLearned;
  final String tagsJson;
  final String? screenshotPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TradesTableData({
    required this.id,
    required this.tradeDate,
    required this.symbol,
    required this.market,
    required this.direction,
    required this.entryPrice,
    this.exitPrice,
    required this.quantity,
    required this.contractMultiplier,
    required this.strategy,
    this.setup,
    this.stopLoss,
    this.takeProfit,
    this.entryTime,
    this.exitTime,
    this.tradingSession,
    this.timeframe,
    required this.brokerage,
    required this.exchangeFees,
    required this.spreadCommission,
    required this.otherCosts,
    required this.totalCosts,
    required this.grossPnL,
    required this.netPnL,
    this.riskRewardRatio,
    this.rMultiple,
    required this.status,
    required this.outcome,
    required this.account,
    this.entryReason,
    this.exitReason,
    this.emotionalState,
    required this.ruleFollowed,
    this.mistakes,
    this.lessonsLearned,
    required this.tagsJson,
    this.screenshotPath,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['trade_date'] = Variable<DateTime>(tradeDate);
    map['symbol'] = Variable<String>(symbol);
    map['market'] = Variable<String>(market);
    map['direction'] = Variable<String>(direction);
    map['entry_price'] = Variable<double>(entryPrice);
    if (!nullToAbsent || exitPrice != null) {
      map['exit_price'] = Variable<double>(exitPrice);
    }
    map['quantity'] = Variable<double>(quantity);
    map['contract_multiplier'] = Variable<double>(contractMultiplier);
    map['strategy'] = Variable<String>(strategy);
    if (!nullToAbsent || setup != null) {
      map['setup'] = Variable<String>(setup);
    }
    if (!nullToAbsent || stopLoss != null) {
      map['stop_loss'] = Variable<double>(stopLoss);
    }
    if (!nullToAbsent || takeProfit != null) {
      map['take_profit'] = Variable<double>(takeProfit);
    }
    if (!nullToAbsent || entryTime != null) {
      map['entry_time'] = Variable<String>(entryTime);
    }
    if (!nullToAbsent || exitTime != null) {
      map['exit_time'] = Variable<String>(exitTime);
    }
    if (!nullToAbsent || tradingSession != null) {
      map['trading_session'] = Variable<String>(tradingSession);
    }
    if (!nullToAbsent || timeframe != null) {
      map['timeframe'] = Variable<String>(timeframe);
    }
    map['brokerage'] = Variable<double>(brokerage);
    map['exchange_fees'] = Variable<double>(exchangeFees);
    map['spread_commission'] = Variable<double>(spreadCommission);
    map['other_costs'] = Variable<double>(otherCosts);
    map['total_costs'] = Variable<double>(totalCosts);
    map['gross_pn_l'] = Variable<double>(grossPnL);
    map['net_pn_l'] = Variable<double>(netPnL);
    if (!nullToAbsent || riskRewardRatio != null) {
      map['risk_reward_ratio'] = Variable<double>(riskRewardRatio);
    }
    if (!nullToAbsent || rMultiple != null) {
      map['r_multiple'] = Variable<double>(rMultiple);
    }
    map['status'] = Variable<String>(status);
    map['outcome'] = Variable<String>(outcome);
    map['account'] = Variable<String>(account);
    if (!nullToAbsent || entryReason != null) {
      map['entry_reason'] = Variable<String>(entryReason);
    }
    if (!nullToAbsent || exitReason != null) {
      map['exit_reason'] = Variable<String>(exitReason);
    }
    if (!nullToAbsent || emotionalState != null) {
      map['emotional_state'] = Variable<String>(emotionalState);
    }
    map['rule_followed'] = Variable<bool>(ruleFollowed);
    if (!nullToAbsent || mistakes != null) {
      map['mistakes'] = Variable<String>(mistakes);
    }
    if (!nullToAbsent || lessonsLearned != null) {
      map['lessons_learned'] = Variable<String>(lessonsLearned);
    }
    map['tags_json'] = Variable<String>(tagsJson);
    if (!nullToAbsent || screenshotPath != null) {
      map['screenshot_path'] = Variable<String>(screenshotPath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TradesTableCompanion toCompanion(bool nullToAbsent) {
    return TradesTableCompanion(
      id: Value(id),
      tradeDate: Value(tradeDate),
      symbol: Value(symbol),
      market: Value(market),
      direction: Value(direction),
      entryPrice: Value(entryPrice),
      exitPrice: exitPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(exitPrice),
      quantity: Value(quantity),
      contractMultiplier: Value(contractMultiplier),
      strategy: Value(strategy),
      setup: setup == null && nullToAbsent
          ? const Value.absent()
          : Value(setup),
      stopLoss: stopLoss == null && nullToAbsent
          ? const Value.absent()
          : Value(stopLoss),
      takeProfit: takeProfit == null && nullToAbsent
          ? const Value.absent()
          : Value(takeProfit),
      entryTime: entryTime == null && nullToAbsent
          ? const Value.absent()
          : Value(entryTime),
      exitTime: exitTime == null && nullToAbsent
          ? const Value.absent()
          : Value(exitTime),
      tradingSession: tradingSession == null && nullToAbsent
          ? const Value.absent()
          : Value(tradingSession),
      timeframe: timeframe == null && nullToAbsent
          ? const Value.absent()
          : Value(timeframe),
      brokerage: Value(brokerage),
      exchangeFees: Value(exchangeFees),
      spreadCommission: Value(spreadCommission),
      otherCosts: Value(otherCosts),
      totalCosts: Value(totalCosts),
      grossPnL: Value(grossPnL),
      netPnL: Value(netPnL),
      riskRewardRatio: riskRewardRatio == null && nullToAbsent
          ? const Value.absent()
          : Value(riskRewardRatio),
      rMultiple: rMultiple == null && nullToAbsent
          ? const Value.absent()
          : Value(rMultiple),
      status: Value(status),
      outcome: Value(outcome),
      account: Value(account),
      entryReason: entryReason == null && nullToAbsent
          ? const Value.absent()
          : Value(entryReason),
      exitReason: exitReason == null && nullToAbsent
          ? const Value.absent()
          : Value(exitReason),
      emotionalState: emotionalState == null && nullToAbsent
          ? const Value.absent()
          : Value(emotionalState),
      ruleFollowed: Value(ruleFollowed),
      mistakes: mistakes == null && nullToAbsent
          ? const Value.absent()
          : Value(mistakes),
      lessonsLearned: lessonsLearned == null && nullToAbsent
          ? const Value.absent()
          : Value(lessonsLearned),
      tagsJson: Value(tagsJson),
      screenshotPath: screenshotPath == null && nullToAbsent
          ? const Value.absent()
          : Value(screenshotPath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TradesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TradesTableData(
      id: serializer.fromJson<String>(json['id']),
      tradeDate: serializer.fromJson<DateTime>(json['tradeDate']),
      symbol: serializer.fromJson<String>(json['symbol']),
      market: serializer.fromJson<String>(json['market']),
      direction: serializer.fromJson<String>(json['direction']),
      entryPrice: serializer.fromJson<double>(json['entryPrice']),
      exitPrice: serializer.fromJson<double?>(json['exitPrice']),
      quantity: serializer.fromJson<double>(json['quantity']),
      contractMultiplier: serializer.fromJson<double>(
        json['contractMultiplier'],
      ),
      strategy: serializer.fromJson<String>(json['strategy']),
      setup: serializer.fromJson<String?>(json['setup']),
      stopLoss: serializer.fromJson<double?>(json['stopLoss']),
      takeProfit: serializer.fromJson<double?>(json['takeProfit']),
      entryTime: serializer.fromJson<String?>(json['entryTime']),
      exitTime: serializer.fromJson<String?>(json['exitTime']),
      tradingSession: serializer.fromJson<String?>(json['tradingSession']),
      timeframe: serializer.fromJson<String?>(json['timeframe']),
      brokerage: serializer.fromJson<double>(json['brokerage']),
      exchangeFees: serializer.fromJson<double>(json['exchangeFees']),
      spreadCommission: serializer.fromJson<double>(json['spreadCommission']),
      otherCosts: serializer.fromJson<double>(json['otherCosts']),
      totalCosts: serializer.fromJson<double>(json['totalCosts']),
      grossPnL: serializer.fromJson<double>(json['grossPnL']),
      netPnL: serializer.fromJson<double>(json['netPnL']),
      riskRewardRatio: serializer.fromJson<double?>(json['riskRewardRatio']),
      rMultiple: serializer.fromJson<double?>(json['rMultiple']),
      status: serializer.fromJson<String>(json['status']),
      outcome: serializer.fromJson<String>(json['outcome']),
      account: serializer.fromJson<String>(json['account']),
      entryReason: serializer.fromJson<String?>(json['entryReason']),
      exitReason: serializer.fromJson<String?>(json['exitReason']),
      emotionalState: serializer.fromJson<String?>(json['emotionalState']),
      ruleFollowed: serializer.fromJson<bool>(json['ruleFollowed']),
      mistakes: serializer.fromJson<String?>(json['mistakes']),
      lessonsLearned: serializer.fromJson<String?>(json['lessonsLearned']),
      tagsJson: serializer.fromJson<String>(json['tagsJson']),
      screenshotPath: serializer.fromJson<String?>(json['screenshotPath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'tradeDate': serializer.toJson<DateTime>(tradeDate),
      'symbol': serializer.toJson<String>(symbol),
      'market': serializer.toJson<String>(market),
      'direction': serializer.toJson<String>(direction),
      'entryPrice': serializer.toJson<double>(entryPrice),
      'exitPrice': serializer.toJson<double?>(exitPrice),
      'quantity': serializer.toJson<double>(quantity),
      'contractMultiplier': serializer.toJson<double>(contractMultiplier),
      'strategy': serializer.toJson<String>(strategy),
      'setup': serializer.toJson<String?>(setup),
      'stopLoss': serializer.toJson<double?>(stopLoss),
      'takeProfit': serializer.toJson<double?>(takeProfit),
      'entryTime': serializer.toJson<String?>(entryTime),
      'exitTime': serializer.toJson<String?>(exitTime),
      'tradingSession': serializer.toJson<String?>(tradingSession),
      'timeframe': serializer.toJson<String?>(timeframe),
      'brokerage': serializer.toJson<double>(brokerage),
      'exchangeFees': serializer.toJson<double>(exchangeFees),
      'spreadCommission': serializer.toJson<double>(spreadCommission),
      'otherCosts': serializer.toJson<double>(otherCosts),
      'totalCosts': serializer.toJson<double>(totalCosts),
      'grossPnL': serializer.toJson<double>(grossPnL),
      'netPnL': serializer.toJson<double>(netPnL),
      'riskRewardRatio': serializer.toJson<double?>(riskRewardRatio),
      'rMultiple': serializer.toJson<double?>(rMultiple),
      'status': serializer.toJson<String>(status),
      'outcome': serializer.toJson<String>(outcome),
      'account': serializer.toJson<String>(account),
      'entryReason': serializer.toJson<String?>(entryReason),
      'exitReason': serializer.toJson<String?>(exitReason),
      'emotionalState': serializer.toJson<String?>(emotionalState),
      'ruleFollowed': serializer.toJson<bool>(ruleFollowed),
      'mistakes': serializer.toJson<String?>(mistakes),
      'lessonsLearned': serializer.toJson<String?>(lessonsLearned),
      'tagsJson': serializer.toJson<String>(tagsJson),
      'screenshotPath': serializer.toJson<String?>(screenshotPath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TradesTableData copyWith({
    String? id,
    DateTime? tradeDate,
    String? symbol,
    String? market,
    String? direction,
    double? entryPrice,
    Value<double?> exitPrice = const Value.absent(),
    double? quantity,
    double? contractMultiplier,
    String? strategy,
    Value<String?> setup = const Value.absent(),
    Value<double?> stopLoss = const Value.absent(),
    Value<double?> takeProfit = const Value.absent(),
    Value<String?> entryTime = const Value.absent(),
    Value<String?> exitTime = const Value.absent(),
    Value<String?> tradingSession = const Value.absent(),
    Value<String?> timeframe = const Value.absent(),
    double? brokerage,
    double? exchangeFees,
    double? spreadCommission,
    double? otherCosts,
    double? totalCosts,
    double? grossPnL,
    double? netPnL,
    Value<double?> riskRewardRatio = const Value.absent(),
    Value<double?> rMultiple = const Value.absent(),
    String? status,
    String? outcome,
    String? account,
    Value<String?> entryReason = const Value.absent(),
    Value<String?> exitReason = const Value.absent(),
    Value<String?> emotionalState = const Value.absent(),
    bool? ruleFollowed,
    Value<String?> mistakes = const Value.absent(),
    Value<String?> lessonsLearned = const Value.absent(),
    String? tagsJson,
    Value<String?> screenshotPath = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => TradesTableData(
    id: id ?? this.id,
    tradeDate: tradeDate ?? this.tradeDate,
    symbol: symbol ?? this.symbol,
    market: market ?? this.market,
    direction: direction ?? this.direction,
    entryPrice: entryPrice ?? this.entryPrice,
    exitPrice: exitPrice.present ? exitPrice.value : this.exitPrice,
    quantity: quantity ?? this.quantity,
    contractMultiplier: contractMultiplier ?? this.contractMultiplier,
    strategy: strategy ?? this.strategy,
    setup: setup.present ? setup.value : this.setup,
    stopLoss: stopLoss.present ? stopLoss.value : this.stopLoss,
    takeProfit: takeProfit.present ? takeProfit.value : this.takeProfit,
    entryTime: entryTime.present ? entryTime.value : this.entryTime,
    exitTime: exitTime.present ? exitTime.value : this.exitTime,
    tradingSession: tradingSession.present
        ? tradingSession.value
        : this.tradingSession,
    timeframe: timeframe.present ? timeframe.value : this.timeframe,
    brokerage: brokerage ?? this.brokerage,
    exchangeFees: exchangeFees ?? this.exchangeFees,
    spreadCommission: spreadCommission ?? this.spreadCommission,
    otherCosts: otherCosts ?? this.otherCosts,
    totalCosts: totalCosts ?? this.totalCosts,
    grossPnL: grossPnL ?? this.grossPnL,
    netPnL: netPnL ?? this.netPnL,
    riskRewardRatio: riskRewardRatio.present
        ? riskRewardRatio.value
        : this.riskRewardRatio,
    rMultiple: rMultiple.present ? rMultiple.value : this.rMultiple,
    status: status ?? this.status,
    outcome: outcome ?? this.outcome,
    account: account ?? this.account,
    entryReason: entryReason.present ? entryReason.value : this.entryReason,
    exitReason: exitReason.present ? exitReason.value : this.exitReason,
    emotionalState: emotionalState.present
        ? emotionalState.value
        : this.emotionalState,
    ruleFollowed: ruleFollowed ?? this.ruleFollowed,
    mistakes: mistakes.present ? mistakes.value : this.mistakes,
    lessonsLearned: lessonsLearned.present
        ? lessonsLearned.value
        : this.lessonsLearned,
    tagsJson: tagsJson ?? this.tagsJson,
    screenshotPath: screenshotPath.present
        ? screenshotPath.value
        : this.screenshotPath,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TradesTableData copyWithCompanion(TradesTableCompanion data) {
    return TradesTableData(
      id: data.id.present ? data.id.value : this.id,
      tradeDate: data.tradeDate.present ? data.tradeDate.value : this.tradeDate,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      market: data.market.present ? data.market.value : this.market,
      direction: data.direction.present ? data.direction.value : this.direction,
      entryPrice: data.entryPrice.present
          ? data.entryPrice.value
          : this.entryPrice,
      exitPrice: data.exitPrice.present ? data.exitPrice.value : this.exitPrice,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      contractMultiplier: data.contractMultiplier.present
          ? data.contractMultiplier.value
          : this.contractMultiplier,
      strategy: data.strategy.present ? data.strategy.value : this.strategy,
      setup: data.setup.present ? data.setup.value : this.setup,
      stopLoss: data.stopLoss.present ? data.stopLoss.value : this.stopLoss,
      takeProfit: data.takeProfit.present
          ? data.takeProfit.value
          : this.takeProfit,
      entryTime: data.entryTime.present ? data.entryTime.value : this.entryTime,
      exitTime: data.exitTime.present ? data.exitTime.value : this.exitTime,
      tradingSession: data.tradingSession.present
          ? data.tradingSession.value
          : this.tradingSession,
      timeframe: data.timeframe.present ? data.timeframe.value : this.timeframe,
      brokerage: data.brokerage.present ? data.brokerage.value : this.brokerage,
      exchangeFees: data.exchangeFees.present
          ? data.exchangeFees.value
          : this.exchangeFees,
      spreadCommission: data.spreadCommission.present
          ? data.spreadCommission.value
          : this.spreadCommission,
      otherCosts: data.otherCosts.present
          ? data.otherCosts.value
          : this.otherCosts,
      totalCosts: data.totalCosts.present
          ? data.totalCosts.value
          : this.totalCosts,
      grossPnL: data.grossPnL.present ? data.grossPnL.value : this.grossPnL,
      netPnL: data.netPnL.present ? data.netPnL.value : this.netPnL,
      riskRewardRatio: data.riskRewardRatio.present
          ? data.riskRewardRatio.value
          : this.riskRewardRatio,
      rMultiple: data.rMultiple.present ? data.rMultiple.value : this.rMultiple,
      status: data.status.present ? data.status.value : this.status,
      outcome: data.outcome.present ? data.outcome.value : this.outcome,
      account: data.account.present ? data.account.value : this.account,
      entryReason: data.entryReason.present
          ? data.entryReason.value
          : this.entryReason,
      exitReason: data.exitReason.present
          ? data.exitReason.value
          : this.exitReason,
      emotionalState: data.emotionalState.present
          ? data.emotionalState.value
          : this.emotionalState,
      ruleFollowed: data.ruleFollowed.present
          ? data.ruleFollowed.value
          : this.ruleFollowed,
      mistakes: data.mistakes.present ? data.mistakes.value : this.mistakes,
      lessonsLearned: data.lessonsLearned.present
          ? data.lessonsLearned.value
          : this.lessonsLearned,
      tagsJson: data.tagsJson.present ? data.tagsJson.value : this.tagsJson,
      screenshotPath: data.screenshotPath.present
          ? data.screenshotPath.value
          : this.screenshotPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TradesTableData(')
          ..write('id: $id, ')
          ..write('tradeDate: $tradeDate, ')
          ..write('symbol: $symbol, ')
          ..write('market: $market, ')
          ..write('direction: $direction, ')
          ..write('entryPrice: $entryPrice, ')
          ..write('exitPrice: $exitPrice, ')
          ..write('quantity: $quantity, ')
          ..write('contractMultiplier: $contractMultiplier, ')
          ..write('strategy: $strategy, ')
          ..write('setup: $setup, ')
          ..write('stopLoss: $stopLoss, ')
          ..write('takeProfit: $takeProfit, ')
          ..write('entryTime: $entryTime, ')
          ..write('exitTime: $exitTime, ')
          ..write('tradingSession: $tradingSession, ')
          ..write('timeframe: $timeframe, ')
          ..write('brokerage: $brokerage, ')
          ..write('exchangeFees: $exchangeFees, ')
          ..write('spreadCommission: $spreadCommission, ')
          ..write('otherCosts: $otherCosts, ')
          ..write('totalCosts: $totalCosts, ')
          ..write('grossPnL: $grossPnL, ')
          ..write('netPnL: $netPnL, ')
          ..write('riskRewardRatio: $riskRewardRatio, ')
          ..write('rMultiple: $rMultiple, ')
          ..write('status: $status, ')
          ..write('outcome: $outcome, ')
          ..write('account: $account, ')
          ..write('entryReason: $entryReason, ')
          ..write('exitReason: $exitReason, ')
          ..write('emotionalState: $emotionalState, ')
          ..write('ruleFollowed: $ruleFollowed, ')
          ..write('mistakes: $mistakes, ')
          ..write('lessonsLearned: $lessonsLearned, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('screenshotPath: $screenshotPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    tradeDate,
    symbol,
    market,
    direction,
    entryPrice,
    exitPrice,
    quantity,
    contractMultiplier,
    strategy,
    setup,
    stopLoss,
    takeProfit,
    entryTime,
    exitTime,
    tradingSession,
    timeframe,
    brokerage,
    exchangeFees,
    spreadCommission,
    otherCosts,
    totalCosts,
    grossPnL,
    netPnL,
    riskRewardRatio,
    rMultiple,
    status,
    outcome,
    account,
    entryReason,
    exitReason,
    emotionalState,
    ruleFollowed,
    mistakes,
    lessonsLearned,
    tagsJson,
    screenshotPath,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TradesTableData &&
          other.id == this.id &&
          other.tradeDate == this.tradeDate &&
          other.symbol == this.symbol &&
          other.market == this.market &&
          other.direction == this.direction &&
          other.entryPrice == this.entryPrice &&
          other.exitPrice == this.exitPrice &&
          other.quantity == this.quantity &&
          other.contractMultiplier == this.contractMultiplier &&
          other.strategy == this.strategy &&
          other.setup == this.setup &&
          other.stopLoss == this.stopLoss &&
          other.takeProfit == this.takeProfit &&
          other.entryTime == this.entryTime &&
          other.exitTime == this.exitTime &&
          other.tradingSession == this.tradingSession &&
          other.timeframe == this.timeframe &&
          other.brokerage == this.brokerage &&
          other.exchangeFees == this.exchangeFees &&
          other.spreadCommission == this.spreadCommission &&
          other.otherCosts == this.otherCosts &&
          other.totalCosts == this.totalCosts &&
          other.grossPnL == this.grossPnL &&
          other.netPnL == this.netPnL &&
          other.riskRewardRatio == this.riskRewardRatio &&
          other.rMultiple == this.rMultiple &&
          other.status == this.status &&
          other.outcome == this.outcome &&
          other.account == this.account &&
          other.entryReason == this.entryReason &&
          other.exitReason == this.exitReason &&
          other.emotionalState == this.emotionalState &&
          other.ruleFollowed == this.ruleFollowed &&
          other.mistakes == this.mistakes &&
          other.lessonsLearned == this.lessonsLearned &&
          other.tagsJson == this.tagsJson &&
          other.screenshotPath == this.screenshotPath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TradesTableCompanion extends UpdateCompanion<TradesTableData> {
  final Value<String> id;
  final Value<DateTime> tradeDate;
  final Value<String> symbol;
  final Value<String> market;
  final Value<String> direction;
  final Value<double> entryPrice;
  final Value<double?> exitPrice;
  final Value<double> quantity;
  final Value<double> contractMultiplier;
  final Value<String> strategy;
  final Value<String?> setup;
  final Value<double?> stopLoss;
  final Value<double?> takeProfit;
  final Value<String?> entryTime;
  final Value<String?> exitTime;
  final Value<String?> tradingSession;
  final Value<String?> timeframe;
  final Value<double> brokerage;
  final Value<double> exchangeFees;
  final Value<double> spreadCommission;
  final Value<double> otherCosts;
  final Value<double> totalCosts;
  final Value<double> grossPnL;
  final Value<double> netPnL;
  final Value<double?> riskRewardRatio;
  final Value<double?> rMultiple;
  final Value<String> status;
  final Value<String> outcome;
  final Value<String> account;
  final Value<String?> entryReason;
  final Value<String?> exitReason;
  final Value<String?> emotionalState;
  final Value<bool> ruleFollowed;
  final Value<String?> mistakes;
  final Value<String?> lessonsLearned;
  final Value<String> tagsJson;
  final Value<String?> screenshotPath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TradesTableCompanion({
    this.id = const Value.absent(),
    this.tradeDate = const Value.absent(),
    this.symbol = const Value.absent(),
    this.market = const Value.absent(),
    this.direction = const Value.absent(),
    this.entryPrice = const Value.absent(),
    this.exitPrice = const Value.absent(),
    this.quantity = const Value.absent(),
    this.contractMultiplier = const Value.absent(),
    this.strategy = const Value.absent(),
    this.setup = const Value.absent(),
    this.stopLoss = const Value.absent(),
    this.takeProfit = const Value.absent(),
    this.entryTime = const Value.absent(),
    this.exitTime = const Value.absent(),
    this.tradingSession = const Value.absent(),
    this.timeframe = const Value.absent(),
    this.brokerage = const Value.absent(),
    this.exchangeFees = const Value.absent(),
    this.spreadCommission = const Value.absent(),
    this.otherCosts = const Value.absent(),
    this.totalCosts = const Value.absent(),
    this.grossPnL = const Value.absent(),
    this.netPnL = const Value.absent(),
    this.riskRewardRatio = const Value.absent(),
    this.rMultiple = const Value.absent(),
    this.status = const Value.absent(),
    this.outcome = const Value.absent(),
    this.account = const Value.absent(),
    this.entryReason = const Value.absent(),
    this.exitReason = const Value.absent(),
    this.emotionalState = const Value.absent(),
    this.ruleFollowed = const Value.absent(),
    this.mistakes = const Value.absent(),
    this.lessonsLearned = const Value.absent(),
    this.tagsJson = const Value.absent(),
    this.screenshotPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TradesTableCompanion.insert({
    required String id,
    required DateTime tradeDate,
    required String symbol,
    required String market,
    required String direction,
    required double entryPrice,
    this.exitPrice = const Value.absent(),
    required double quantity,
    this.contractMultiplier = const Value.absent(),
    required String strategy,
    this.setup = const Value.absent(),
    this.stopLoss = const Value.absent(),
    this.takeProfit = const Value.absent(),
    this.entryTime = const Value.absent(),
    this.exitTime = const Value.absent(),
    this.tradingSession = const Value.absent(),
    this.timeframe = const Value.absent(),
    this.brokerage = const Value.absent(),
    this.exchangeFees = const Value.absent(),
    this.spreadCommission = const Value.absent(),
    this.otherCosts = const Value.absent(),
    this.totalCosts = const Value.absent(),
    this.grossPnL = const Value.absent(),
    this.netPnL = const Value.absent(),
    this.riskRewardRatio = const Value.absent(),
    this.rMultiple = const Value.absent(),
    required String status,
    required String outcome,
    this.account = const Value.absent(),
    this.entryReason = const Value.absent(),
    this.exitReason = const Value.absent(),
    this.emotionalState = const Value.absent(),
    this.ruleFollowed = const Value.absent(),
    this.mistakes = const Value.absent(),
    this.lessonsLearned = const Value.absent(),
    this.tagsJson = const Value.absent(),
    this.screenshotPath = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       tradeDate = Value(tradeDate),
       symbol = Value(symbol),
       market = Value(market),
       direction = Value(direction),
       entryPrice = Value(entryPrice),
       quantity = Value(quantity),
       strategy = Value(strategy),
       status = Value(status),
       outcome = Value(outcome),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TradesTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? tradeDate,
    Expression<String>? symbol,
    Expression<String>? market,
    Expression<String>? direction,
    Expression<double>? entryPrice,
    Expression<double>? exitPrice,
    Expression<double>? quantity,
    Expression<double>? contractMultiplier,
    Expression<String>? strategy,
    Expression<String>? setup,
    Expression<double>? stopLoss,
    Expression<double>? takeProfit,
    Expression<String>? entryTime,
    Expression<String>? exitTime,
    Expression<String>? tradingSession,
    Expression<String>? timeframe,
    Expression<double>? brokerage,
    Expression<double>? exchangeFees,
    Expression<double>? spreadCommission,
    Expression<double>? otherCosts,
    Expression<double>? totalCosts,
    Expression<double>? grossPnL,
    Expression<double>? netPnL,
    Expression<double>? riskRewardRatio,
    Expression<double>? rMultiple,
    Expression<String>? status,
    Expression<String>? outcome,
    Expression<String>? account,
    Expression<String>? entryReason,
    Expression<String>? exitReason,
    Expression<String>? emotionalState,
    Expression<bool>? ruleFollowed,
    Expression<String>? mistakes,
    Expression<String>? lessonsLearned,
    Expression<String>? tagsJson,
    Expression<String>? screenshotPath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tradeDate != null) 'trade_date': tradeDate,
      if (symbol != null) 'symbol': symbol,
      if (market != null) 'market': market,
      if (direction != null) 'direction': direction,
      if (entryPrice != null) 'entry_price': entryPrice,
      if (exitPrice != null) 'exit_price': exitPrice,
      if (quantity != null) 'quantity': quantity,
      if (contractMultiplier != null) 'contract_multiplier': contractMultiplier,
      if (strategy != null) 'strategy': strategy,
      if (setup != null) 'setup': setup,
      if (stopLoss != null) 'stop_loss': stopLoss,
      if (takeProfit != null) 'take_profit': takeProfit,
      if (entryTime != null) 'entry_time': entryTime,
      if (exitTime != null) 'exit_time': exitTime,
      if (tradingSession != null) 'trading_session': tradingSession,
      if (timeframe != null) 'timeframe': timeframe,
      if (brokerage != null) 'brokerage': brokerage,
      if (exchangeFees != null) 'exchange_fees': exchangeFees,
      if (spreadCommission != null) 'spread_commission': spreadCommission,
      if (otherCosts != null) 'other_costs': otherCosts,
      if (totalCosts != null) 'total_costs': totalCosts,
      if (grossPnL != null) 'gross_pn_l': grossPnL,
      if (netPnL != null) 'net_pn_l': netPnL,
      if (riskRewardRatio != null) 'risk_reward_ratio': riskRewardRatio,
      if (rMultiple != null) 'r_multiple': rMultiple,
      if (status != null) 'status': status,
      if (outcome != null) 'outcome': outcome,
      if (account != null) 'account': account,
      if (entryReason != null) 'entry_reason': entryReason,
      if (exitReason != null) 'exit_reason': exitReason,
      if (emotionalState != null) 'emotional_state': emotionalState,
      if (ruleFollowed != null) 'rule_followed': ruleFollowed,
      if (mistakes != null) 'mistakes': mistakes,
      if (lessonsLearned != null) 'lessons_learned': lessonsLearned,
      if (tagsJson != null) 'tags_json': tagsJson,
      if (screenshotPath != null) 'screenshot_path': screenshotPath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TradesTableCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? tradeDate,
    Value<String>? symbol,
    Value<String>? market,
    Value<String>? direction,
    Value<double>? entryPrice,
    Value<double?>? exitPrice,
    Value<double>? quantity,
    Value<double>? contractMultiplier,
    Value<String>? strategy,
    Value<String?>? setup,
    Value<double?>? stopLoss,
    Value<double?>? takeProfit,
    Value<String?>? entryTime,
    Value<String?>? exitTime,
    Value<String?>? tradingSession,
    Value<String?>? timeframe,
    Value<double>? brokerage,
    Value<double>? exchangeFees,
    Value<double>? spreadCommission,
    Value<double>? otherCosts,
    Value<double>? totalCosts,
    Value<double>? grossPnL,
    Value<double>? netPnL,
    Value<double?>? riskRewardRatio,
    Value<double?>? rMultiple,
    Value<String>? status,
    Value<String>? outcome,
    Value<String>? account,
    Value<String?>? entryReason,
    Value<String?>? exitReason,
    Value<String?>? emotionalState,
    Value<bool>? ruleFollowed,
    Value<String?>? mistakes,
    Value<String?>? lessonsLearned,
    Value<String>? tagsJson,
    Value<String?>? screenshotPath,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return TradesTableCompanion(
      id: id ?? this.id,
      tradeDate: tradeDate ?? this.tradeDate,
      symbol: symbol ?? this.symbol,
      market: market ?? this.market,
      direction: direction ?? this.direction,
      entryPrice: entryPrice ?? this.entryPrice,
      exitPrice: exitPrice ?? this.exitPrice,
      quantity: quantity ?? this.quantity,
      contractMultiplier: contractMultiplier ?? this.contractMultiplier,
      strategy: strategy ?? this.strategy,
      setup: setup ?? this.setup,
      stopLoss: stopLoss ?? this.stopLoss,
      takeProfit: takeProfit ?? this.takeProfit,
      entryTime: entryTime ?? this.entryTime,
      exitTime: exitTime ?? this.exitTime,
      tradingSession: tradingSession ?? this.tradingSession,
      timeframe: timeframe ?? this.timeframe,
      brokerage: brokerage ?? this.brokerage,
      exchangeFees: exchangeFees ?? this.exchangeFees,
      spreadCommission: spreadCommission ?? this.spreadCommission,
      otherCosts: otherCosts ?? this.otherCosts,
      totalCosts: totalCosts ?? this.totalCosts,
      grossPnL: grossPnL ?? this.grossPnL,
      netPnL: netPnL ?? this.netPnL,
      riskRewardRatio: riskRewardRatio ?? this.riskRewardRatio,
      rMultiple: rMultiple ?? this.rMultiple,
      status: status ?? this.status,
      outcome: outcome ?? this.outcome,
      account: account ?? this.account,
      entryReason: entryReason ?? this.entryReason,
      exitReason: exitReason ?? this.exitReason,
      emotionalState: emotionalState ?? this.emotionalState,
      ruleFollowed: ruleFollowed ?? this.ruleFollowed,
      mistakes: mistakes ?? this.mistakes,
      lessonsLearned: lessonsLearned ?? this.lessonsLearned,
      tagsJson: tagsJson ?? this.tagsJson,
      screenshotPath: screenshotPath ?? this.screenshotPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tradeDate.present) {
      map['trade_date'] = Variable<DateTime>(tradeDate.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (market.present) {
      map['market'] = Variable<String>(market.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (entryPrice.present) {
      map['entry_price'] = Variable<double>(entryPrice.value);
    }
    if (exitPrice.present) {
      map['exit_price'] = Variable<double>(exitPrice.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (contractMultiplier.present) {
      map['contract_multiplier'] = Variable<double>(contractMultiplier.value);
    }
    if (strategy.present) {
      map['strategy'] = Variable<String>(strategy.value);
    }
    if (setup.present) {
      map['setup'] = Variable<String>(setup.value);
    }
    if (stopLoss.present) {
      map['stop_loss'] = Variable<double>(stopLoss.value);
    }
    if (takeProfit.present) {
      map['take_profit'] = Variable<double>(takeProfit.value);
    }
    if (entryTime.present) {
      map['entry_time'] = Variable<String>(entryTime.value);
    }
    if (exitTime.present) {
      map['exit_time'] = Variable<String>(exitTime.value);
    }
    if (tradingSession.present) {
      map['trading_session'] = Variable<String>(tradingSession.value);
    }
    if (timeframe.present) {
      map['timeframe'] = Variable<String>(timeframe.value);
    }
    if (brokerage.present) {
      map['brokerage'] = Variable<double>(brokerage.value);
    }
    if (exchangeFees.present) {
      map['exchange_fees'] = Variable<double>(exchangeFees.value);
    }
    if (spreadCommission.present) {
      map['spread_commission'] = Variable<double>(spreadCommission.value);
    }
    if (otherCosts.present) {
      map['other_costs'] = Variable<double>(otherCosts.value);
    }
    if (totalCosts.present) {
      map['total_costs'] = Variable<double>(totalCosts.value);
    }
    if (grossPnL.present) {
      map['gross_pn_l'] = Variable<double>(grossPnL.value);
    }
    if (netPnL.present) {
      map['net_pn_l'] = Variable<double>(netPnL.value);
    }
    if (riskRewardRatio.present) {
      map['risk_reward_ratio'] = Variable<double>(riskRewardRatio.value);
    }
    if (rMultiple.present) {
      map['r_multiple'] = Variable<double>(rMultiple.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (outcome.present) {
      map['outcome'] = Variable<String>(outcome.value);
    }
    if (account.present) {
      map['account'] = Variable<String>(account.value);
    }
    if (entryReason.present) {
      map['entry_reason'] = Variable<String>(entryReason.value);
    }
    if (exitReason.present) {
      map['exit_reason'] = Variable<String>(exitReason.value);
    }
    if (emotionalState.present) {
      map['emotional_state'] = Variable<String>(emotionalState.value);
    }
    if (ruleFollowed.present) {
      map['rule_followed'] = Variable<bool>(ruleFollowed.value);
    }
    if (mistakes.present) {
      map['mistakes'] = Variable<String>(mistakes.value);
    }
    if (lessonsLearned.present) {
      map['lessons_learned'] = Variable<String>(lessonsLearned.value);
    }
    if (tagsJson.present) {
      map['tags_json'] = Variable<String>(tagsJson.value);
    }
    if (screenshotPath.present) {
      map['screenshot_path'] = Variable<String>(screenshotPath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TradesTableCompanion(')
          ..write('id: $id, ')
          ..write('tradeDate: $tradeDate, ')
          ..write('symbol: $symbol, ')
          ..write('market: $market, ')
          ..write('direction: $direction, ')
          ..write('entryPrice: $entryPrice, ')
          ..write('exitPrice: $exitPrice, ')
          ..write('quantity: $quantity, ')
          ..write('contractMultiplier: $contractMultiplier, ')
          ..write('strategy: $strategy, ')
          ..write('setup: $setup, ')
          ..write('stopLoss: $stopLoss, ')
          ..write('takeProfit: $takeProfit, ')
          ..write('entryTime: $entryTime, ')
          ..write('exitTime: $exitTime, ')
          ..write('tradingSession: $tradingSession, ')
          ..write('timeframe: $timeframe, ')
          ..write('brokerage: $brokerage, ')
          ..write('exchangeFees: $exchangeFees, ')
          ..write('spreadCommission: $spreadCommission, ')
          ..write('otherCosts: $otherCosts, ')
          ..write('totalCosts: $totalCosts, ')
          ..write('grossPnL: $grossPnL, ')
          ..write('netPnL: $netPnL, ')
          ..write('riskRewardRatio: $riskRewardRatio, ')
          ..write('rMultiple: $rMultiple, ')
          ..write('status: $status, ')
          ..write('outcome: $outcome, ')
          ..write('account: $account, ')
          ..write('entryReason: $entryReason, ')
          ..write('exitReason: $exitReason, ')
          ..write('emotionalState: $emotionalState, ')
          ..write('ruleFollowed: $ruleFollowed, ')
          ..write('mistakes: $mistakes, ')
          ..write('lessonsLearned: $lessonsLearned, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('screenshotPath: $screenshotPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StrategiesTableTable extends StrategiesTable
    with TableInfo<$StrategiesTableTable, StrategiesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StrategiesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('#D4AF37'),
  );
  static const VerificationMeta _marketMeta = const VerificationMeta('market');
  @override
  late final GeneratedColumn<String> market = GeneratedColumn<String>(
    'market',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('nse'),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    colorHex,
    market,
    isArchived,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'strategies_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<StrategiesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    }
    if (data.containsKey('market')) {
      context.handle(
        _marketMeta,
        market.isAcceptableOrUnknown(data['market']!, _marketMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StrategiesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StrategiesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      )!,
      market: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}market'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $StrategiesTableTable createAlias(String alias) {
    return $StrategiesTableTable(attachedDatabase, alias);
  }
}

class StrategiesTableData extends DataClass
    implements Insertable<StrategiesTableData> {
  final String id;
  final String name;
  final String? description;
  final String colorHex;
  final String market;
  final bool isArchived;
  final DateTime createdAt;
  const StrategiesTableData({
    required this.id,
    required this.name,
    this.description,
    required this.colorHex,
    required this.market,
    required this.isArchived,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['color_hex'] = Variable<String>(colorHex);
    map['market'] = Variable<String>(market);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  StrategiesTableCompanion toCompanion(bool nullToAbsent) {
    return StrategiesTableCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      colorHex: Value(colorHex),
      market: Value(market),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
    );
  }

  factory StrategiesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StrategiesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      colorHex: serializer.fromJson<String>(json['colorHex']),
      market: serializer.fromJson<String>(json['market']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'colorHex': serializer.toJson<String>(colorHex),
      'market': serializer.toJson<String>(market),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  StrategiesTableData copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    String? colorHex,
    String? market,
    bool? isArchived,
    DateTime? createdAt,
  }) => StrategiesTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    colorHex: colorHex ?? this.colorHex,
    market: market ?? this.market,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
  );
  StrategiesTableData copyWithCompanion(StrategiesTableCompanion data) {
    return StrategiesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      market: data.market.present ? data.market.value : this.market,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StrategiesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('colorHex: $colorHex, ')
          ..write('market: $market, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    colorHex,
    market,
    isArchived,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StrategiesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.colorHex == this.colorHex &&
          other.market == this.market &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt);
}

class StrategiesTableCompanion extends UpdateCompanion<StrategiesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> colorHex;
  final Value<String> market;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const StrategiesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.market = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StrategiesTableCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.market = const Value.absent(),
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<StrategiesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? colorHex,
    Expression<String>? market,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (colorHex != null) 'color_hex': colorHex,
      if (market != null) 'market': market,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StrategiesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String>? colorHex,
    Value<String>? market,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return StrategiesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      colorHex: colorHex ?? this.colorHex,
      market: market ?? this.market,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (market.present) {
      map['market'] = Variable<String>(market.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StrategiesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('colorHex: $colorHex, ')
          ..write('market: $market, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyReviewsTableTable extends DailyReviewsTable
    with TableInfo<$DailyReviewsTableTable, DailyReviewsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyReviewsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reviewDateMeta = const VerificationMeta(
    'reviewDate',
  );
  @override
  late final GeneratedColumn<DateTime> reviewDate = GeneratedColumn<DateTime>(
    'review_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reflectionMeta = const VerificationMeta(
    'reflection',
  );
  @override
  late final GeneratedColumn<String> reflection = GeneratedColumn<String>(
    'reflection',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _disciplineScoreMeta = const VerificationMeta(
    'disciplineScore',
  );
  @override
  late final GeneratedColumn<int> disciplineScore = GeneratedColumn<int>(
    'discipline_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _mistakesMeta = const VerificationMeta(
    'mistakes',
  );
  @override
  late final GeneratedColumn<String> mistakes = GeneratedColumn<String>(
    'mistakes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lessonsLearnedMeta = const VerificationMeta(
    'lessonsLearned',
  );
  @override
  late final GeneratedColumn<String> lessonsLearned = GeneratedColumn<String>(
    'lessons_learned',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reviewDate,
    reflection,
    disciplineScore,
    mistakes,
    lessonsLearned,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_reviews_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyReviewsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('review_date')) {
      context.handle(
        _reviewDateMeta,
        reviewDate.isAcceptableOrUnknown(data['review_date']!, _reviewDateMeta),
      );
    } else if (isInserting) {
      context.missing(_reviewDateMeta);
    }
    if (data.containsKey('reflection')) {
      context.handle(
        _reflectionMeta,
        reflection.isAcceptableOrUnknown(data['reflection']!, _reflectionMeta),
      );
    }
    if (data.containsKey('discipline_score')) {
      context.handle(
        _disciplineScoreMeta,
        disciplineScore.isAcceptableOrUnknown(
          data['discipline_score']!,
          _disciplineScoreMeta,
        ),
      );
    }
    if (data.containsKey('mistakes')) {
      context.handle(
        _mistakesMeta,
        mistakes.isAcceptableOrUnknown(data['mistakes']!, _mistakesMeta),
      );
    }
    if (data.containsKey('lessons_learned')) {
      context.handle(
        _lessonsLearnedMeta,
        lessonsLearned.isAcceptableOrUnknown(
          data['lessons_learned']!,
          _lessonsLearnedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyReviewsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyReviewsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      reviewDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}review_date'],
      )!,
      reflection: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reflection'],
      )!,
      disciplineScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discipline_score'],
      )!,
      mistakes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mistakes'],
      ),
      lessonsLearned: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lessons_learned'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DailyReviewsTableTable createAlias(String alias) {
    return $DailyReviewsTableTable(attachedDatabase, alias);
  }
}

class DailyReviewsTableData extends DataClass
    implements Insertable<DailyReviewsTableData> {
  final String id;
  final DateTime reviewDate;
  final String reflection;
  final int disciplineScore;
  final String? mistakes;
  final String? lessonsLearned;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DailyReviewsTableData({
    required this.id,
    required this.reviewDate,
    required this.reflection,
    required this.disciplineScore,
    this.mistakes,
    this.lessonsLearned,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['review_date'] = Variable<DateTime>(reviewDate);
    map['reflection'] = Variable<String>(reflection);
    map['discipline_score'] = Variable<int>(disciplineScore);
    if (!nullToAbsent || mistakes != null) {
      map['mistakes'] = Variable<String>(mistakes);
    }
    if (!nullToAbsent || lessonsLearned != null) {
      map['lessons_learned'] = Variable<String>(lessonsLearned);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DailyReviewsTableCompanion toCompanion(bool nullToAbsent) {
    return DailyReviewsTableCompanion(
      id: Value(id),
      reviewDate: Value(reviewDate),
      reflection: Value(reflection),
      disciplineScore: Value(disciplineScore),
      mistakes: mistakes == null && nullToAbsent
          ? const Value.absent()
          : Value(mistakes),
      lessonsLearned: lessonsLearned == null && nullToAbsent
          ? const Value.absent()
          : Value(lessonsLearned),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DailyReviewsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyReviewsTableData(
      id: serializer.fromJson<String>(json['id']),
      reviewDate: serializer.fromJson<DateTime>(json['reviewDate']),
      reflection: serializer.fromJson<String>(json['reflection']),
      disciplineScore: serializer.fromJson<int>(json['disciplineScore']),
      mistakes: serializer.fromJson<String?>(json['mistakes']),
      lessonsLearned: serializer.fromJson<String?>(json['lessonsLearned']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'reviewDate': serializer.toJson<DateTime>(reviewDate),
      'reflection': serializer.toJson<String>(reflection),
      'disciplineScore': serializer.toJson<int>(disciplineScore),
      'mistakes': serializer.toJson<String?>(mistakes),
      'lessonsLearned': serializer.toJson<String?>(lessonsLearned),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DailyReviewsTableData copyWith({
    String? id,
    DateTime? reviewDate,
    String? reflection,
    int? disciplineScore,
    Value<String?> mistakes = const Value.absent(),
    Value<String?> lessonsLearned = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DailyReviewsTableData(
    id: id ?? this.id,
    reviewDate: reviewDate ?? this.reviewDate,
    reflection: reflection ?? this.reflection,
    disciplineScore: disciplineScore ?? this.disciplineScore,
    mistakes: mistakes.present ? mistakes.value : this.mistakes,
    lessonsLearned: lessonsLearned.present
        ? lessonsLearned.value
        : this.lessonsLearned,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DailyReviewsTableData copyWithCompanion(DailyReviewsTableCompanion data) {
    return DailyReviewsTableData(
      id: data.id.present ? data.id.value : this.id,
      reviewDate: data.reviewDate.present
          ? data.reviewDate.value
          : this.reviewDate,
      reflection: data.reflection.present
          ? data.reflection.value
          : this.reflection,
      disciplineScore: data.disciplineScore.present
          ? data.disciplineScore.value
          : this.disciplineScore,
      mistakes: data.mistakes.present ? data.mistakes.value : this.mistakes,
      lessonsLearned: data.lessonsLearned.present
          ? data.lessonsLearned.value
          : this.lessonsLearned,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyReviewsTableData(')
          ..write('id: $id, ')
          ..write('reviewDate: $reviewDate, ')
          ..write('reflection: $reflection, ')
          ..write('disciplineScore: $disciplineScore, ')
          ..write('mistakes: $mistakes, ')
          ..write('lessonsLearned: $lessonsLearned, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    reviewDate,
    reflection,
    disciplineScore,
    mistakes,
    lessonsLearned,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyReviewsTableData &&
          other.id == this.id &&
          other.reviewDate == this.reviewDate &&
          other.reflection == this.reflection &&
          other.disciplineScore == this.disciplineScore &&
          other.mistakes == this.mistakes &&
          other.lessonsLearned == this.lessonsLearned &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DailyReviewsTableCompanion
    extends UpdateCompanion<DailyReviewsTableData> {
  final Value<String> id;
  final Value<DateTime> reviewDate;
  final Value<String> reflection;
  final Value<int> disciplineScore;
  final Value<String?> mistakes;
  final Value<String?> lessonsLearned;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const DailyReviewsTableCompanion({
    this.id = const Value.absent(),
    this.reviewDate = const Value.absent(),
    this.reflection = const Value.absent(),
    this.disciplineScore = const Value.absent(),
    this.mistakes = const Value.absent(),
    this.lessonsLearned = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyReviewsTableCompanion.insert({
    required String id,
    required DateTime reviewDate,
    this.reflection = const Value.absent(),
    this.disciplineScore = const Value.absent(),
    this.mistakes = const Value.absent(),
    this.lessonsLearned = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       reviewDate = Value(reviewDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DailyReviewsTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? reviewDate,
    Expression<String>? reflection,
    Expression<int>? disciplineScore,
    Expression<String>? mistakes,
    Expression<String>? lessonsLearned,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reviewDate != null) 'review_date': reviewDate,
      if (reflection != null) 'reflection': reflection,
      if (disciplineScore != null) 'discipline_score': disciplineScore,
      if (mistakes != null) 'mistakes': mistakes,
      if (lessonsLearned != null) 'lessons_learned': lessonsLearned,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyReviewsTableCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? reviewDate,
    Value<String>? reflection,
    Value<int>? disciplineScore,
    Value<String?>? mistakes,
    Value<String?>? lessonsLearned,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return DailyReviewsTableCompanion(
      id: id ?? this.id,
      reviewDate: reviewDate ?? this.reviewDate,
      reflection: reflection ?? this.reflection,
      disciplineScore: disciplineScore ?? this.disciplineScore,
      mistakes: mistakes ?? this.mistakes,
      lessonsLearned: lessonsLearned ?? this.lessonsLearned,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (reviewDate.present) {
      map['review_date'] = Variable<DateTime>(reviewDate.value);
    }
    if (reflection.present) {
      map['reflection'] = Variable<String>(reflection.value);
    }
    if (disciplineScore.present) {
      map['discipline_score'] = Variable<int>(disciplineScore.value);
    }
    if (mistakes.present) {
      map['mistakes'] = Variable<String>(mistakes.value);
    }
    if (lessonsLearned.present) {
      map['lessons_learned'] = Variable<String>(lessonsLearned.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyReviewsTableCompanion(')
          ..write('id: $id, ')
          ..write('reviewDate: $reviewDate, ')
          ..write('reflection: $reflection, ')
          ..write('disciplineScore: $disciplineScore, ')
          ..write('mistakes: $mistakes, ')
          ..write('lessonsLearned: $lessonsLearned, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTableTable extends AppSettingsTable
    with TableInfo<$AppSettingsTableTable, AppSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSettingsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingsTableData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $AppSettingsTableTable createAlias(String alias) {
    return $AppSettingsTableTable(attachedDatabase, alias);
  }
}

class AppSettingsTableData extends DataClass
    implements Insertable<AppSettingsTableData> {
  final String key;
  final String value;
  const AppSettingsTableData({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsTableCompanion(key: Value(key), value: Value(value));
  }

  factory AppSettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingsTableData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppSettingsTableData copyWith({String? key, String? value}) =>
      AppSettingsTableData(key: key ?? this.key, value: value ?? this.value);
  AppSettingsTableData copyWithCompanion(AppSettingsTableCompanion data) {
    return AppSettingsTableData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableData(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingsTableData &&
          other.key == this.key &&
          other.value == this.value);
}

class AppSettingsTableCompanion extends UpdateCompanion<AppSettingsTableData> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AppSettingsTableCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsTableCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<AppSettingsTableData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsTableCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return AppSettingsTableCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TradesTableTable tradesTable = $TradesTableTable(this);
  late final $StrategiesTableTable strategiesTable = $StrategiesTableTable(
    this,
  );
  late final $DailyReviewsTableTable dailyReviewsTable =
      $DailyReviewsTableTable(this);
  late final $AppSettingsTableTable appSettingsTable = $AppSettingsTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tradesTable,
    strategiesTable,
    dailyReviewsTable,
    appSettingsTable,
  ];
}

typedef $$TradesTableTableCreateCompanionBuilder =
    TradesTableCompanion Function({
      required String id,
      required DateTime tradeDate,
      required String symbol,
      required String market,
      required String direction,
      required double entryPrice,
      Value<double?> exitPrice,
      required double quantity,
      Value<double> contractMultiplier,
      required String strategy,
      Value<String?> setup,
      Value<double?> stopLoss,
      Value<double?> takeProfit,
      Value<String?> entryTime,
      Value<String?> exitTime,
      Value<String?> tradingSession,
      Value<String?> timeframe,
      Value<double> brokerage,
      Value<double> exchangeFees,
      Value<double> spreadCommission,
      Value<double> otherCosts,
      Value<double> totalCosts,
      Value<double> grossPnL,
      Value<double> netPnL,
      Value<double?> riskRewardRatio,
      Value<double?> rMultiple,
      required String status,
      required String outcome,
      Value<String> account,
      Value<String?> entryReason,
      Value<String?> exitReason,
      Value<String?> emotionalState,
      Value<bool> ruleFollowed,
      Value<String?> mistakes,
      Value<String?> lessonsLearned,
      Value<String> tagsJson,
      Value<String?> screenshotPath,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$TradesTableTableUpdateCompanionBuilder =
    TradesTableCompanion Function({
      Value<String> id,
      Value<DateTime> tradeDate,
      Value<String> symbol,
      Value<String> market,
      Value<String> direction,
      Value<double> entryPrice,
      Value<double?> exitPrice,
      Value<double> quantity,
      Value<double> contractMultiplier,
      Value<String> strategy,
      Value<String?> setup,
      Value<double?> stopLoss,
      Value<double?> takeProfit,
      Value<String?> entryTime,
      Value<String?> exitTime,
      Value<String?> tradingSession,
      Value<String?> timeframe,
      Value<double> brokerage,
      Value<double> exchangeFees,
      Value<double> spreadCommission,
      Value<double> otherCosts,
      Value<double> totalCosts,
      Value<double> grossPnL,
      Value<double> netPnL,
      Value<double?> riskRewardRatio,
      Value<double?> rMultiple,
      Value<String> status,
      Value<String> outcome,
      Value<String> account,
      Value<String?> entryReason,
      Value<String?> exitReason,
      Value<String?> emotionalState,
      Value<bool> ruleFollowed,
      Value<String?> mistakes,
      Value<String?> lessonsLearned,
      Value<String> tagsJson,
      Value<String?> screenshotPath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$TradesTableTableFilterComposer
    extends Composer<_$AppDatabase, $TradesTableTable> {
  $$TradesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tradeDate => $composableBuilder(
    column: $table.tradeDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get market => $composableBuilder(
    column: $table.market,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get entryPrice => $composableBuilder(
    column: $table.entryPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get exitPrice => $composableBuilder(
    column: $table.exitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get contractMultiplier => $composableBuilder(
    column: $table.contractMultiplier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strategy => $composableBuilder(
    column: $table.strategy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get setup => $composableBuilder(
    column: $table.setup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get stopLoss => $composableBuilder(
    column: $table.stopLoss,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get takeProfit => $composableBuilder(
    column: $table.takeProfit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entryTime => $composableBuilder(
    column: $table.entryTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exitTime => $composableBuilder(
    column: $table.exitTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tradingSession => $composableBuilder(
    column: $table.tradingSession,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timeframe => $composableBuilder(
    column: $table.timeframe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get brokerage => $composableBuilder(
    column: $table.brokerage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get exchangeFees => $composableBuilder(
    column: $table.exchangeFees,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get spreadCommission => $composableBuilder(
    column: $table.spreadCommission,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get otherCosts => $composableBuilder(
    column: $table.otherCosts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalCosts => $composableBuilder(
    column: $table.totalCosts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get grossPnL => $composableBuilder(
    column: $table.grossPnL,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get netPnL => $composableBuilder(
    column: $table.netPnL,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get riskRewardRatio => $composableBuilder(
    column: $table.riskRewardRatio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rMultiple => $composableBuilder(
    column: $table.rMultiple,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get account => $composableBuilder(
    column: $table.account,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entryReason => $composableBuilder(
    column: $table.entryReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exitReason => $composableBuilder(
    column: $table.exitReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emotionalState => $composableBuilder(
    column: $table.emotionalState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get ruleFollowed => $composableBuilder(
    column: $table.ruleFollowed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mistakes => $composableBuilder(
    column: $table.mistakes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lessonsLearned => $composableBuilder(
    column: $table.lessonsLearned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagsJson => $composableBuilder(
    column: $table.tagsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get screenshotPath => $composableBuilder(
    column: $table.screenshotPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TradesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TradesTableTable> {
  $$TradesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tradeDate => $composableBuilder(
    column: $table.tradeDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get market => $composableBuilder(
    column: $table.market,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get entryPrice => $composableBuilder(
    column: $table.entryPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get exitPrice => $composableBuilder(
    column: $table.exitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get contractMultiplier => $composableBuilder(
    column: $table.contractMultiplier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strategy => $composableBuilder(
    column: $table.strategy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get setup => $composableBuilder(
    column: $table.setup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get stopLoss => $composableBuilder(
    column: $table.stopLoss,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get takeProfit => $composableBuilder(
    column: $table.takeProfit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entryTime => $composableBuilder(
    column: $table.entryTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exitTime => $composableBuilder(
    column: $table.exitTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tradingSession => $composableBuilder(
    column: $table.tradingSession,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timeframe => $composableBuilder(
    column: $table.timeframe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get brokerage => $composableBuilder(
    column: $table.brokerage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get exchangeFees => $composableBuilder(
    column: $table.exchangeFees,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get spreadCommission => $composableBuilder(
    column: $table.spreadCommission,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get otherCosts => $composableBuilder(
    column: $table.otherCosts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalCosts => $composableBuilder(
    column: $table.totalCosts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get grossPnL => $composableBuilder(
    column: $table.grossPnL,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get netPnL => $composableBuilder(
    column: $table.netPnL,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get riskRewardRatio => $composableBuilder(
    column: $table.riskRewardRatio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rMultiple => $composableBuilder(
    column: $table.rMultiple,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get account => $composableBuilder(
    column: $table.account,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entryReason => $composableBuilder(
    column: $table.entryReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exitReason => $composableBuilder(
    column: $table.exitReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emotionalState => $composableBuilder(
    column: $table.emotionalState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get ruleFollowed => $composableBuilder(
    column: $table.ruleFollowed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mistakes => $composableBuilder(
    column: $table.mistakes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lessonsLearned => $composableBuilder(
    column: $table.lessonsLearned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagsJson => $composableBuilder(
    column: $table.tagsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get screenshotPath => $composableBuilder(
    column: $table.screenshotPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TradesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TradesTableTable> {
  $$TradesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get tradeDate =>
      $composableBuilder(column: $table.tradeDate, builder: (column) => column);

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumn<String> get market =>
      $composableBuilder(column: $table.market, builder: (column) => column);

  GeneratedColumn<String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<double> get entryPrice => $composableBuilder(
    column: $table.entryPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get exitPrice =>
      $composableBuilder(column: $table.exitPrice, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get contractMultiplier => $composableBuilder(
    column: $table.contractMultiplier,
    builder: (column) => column,
  );

  GeneratedColumn<String> get strategy =>
      $composableBuilder(column: $table.strategy, builder: (column) => column);

  GeneratedColumn<String> get setup =>
      $composableBuilder(column: $table.setup, builder: (column) => column);

  GeneratedColumn<double> get stopLoss =>
      $composableBuilder(column: $table.stopLoss, builder: (column) => column);

  GeneratedColumn<double> get takeProfit => $composableBuilder(
    column: $table.takeProfit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entryTime =>
      $composableBuilder(column: $table.entryTime, builder: (column) => column);

  GeneratedColumn<String> get exitTime =>
      $composableBuilder(column: $table.exitTime, builder: (column) => column);

  GeneratedColumn<String> get tradingSession => $composableBuilder(
    column: $table.tradingSession,
    builder: (column) => column,
  );

  GeneratedColumn<String> get timeframe =>
      $composableBuilder(column: $table.timeframe, builder: (column) => column);

  GeneratedColumn<double> get brokerage =>
      $composableBuilder(column: $table.brokerage, builder: (column) => column);

  GeneratedColumn<double> get exchangeFees => $composableBuilder(
    column: $table.exchangeFees,
    builder: (column) => column,
  );

  GeneratedColumn<double> get spreadCommission => $composableBuilder(
    column: $table.spreadCommission,
    builder: (column) => column,
  );

  GeneratedColumn<double> get otherCosts => $composableBuilder(
    column: $table.otherCosts,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalCosts => $composableBuilder(
    column: $table.totalCosts,
    builder: (column) => column,
  );

  GeneratedColumn<double> get grossPnL =>
      $composableBuilder(column: $table.grossPnL, builder: (column) => column);

  GeneratedColumn<double> get netPnL =>
      $composableBuilder(column: $table.netPnL, builder: (column) => column);

  GeneratedColumn<double> get riskRewardRatio => $composableBuilder(
    column: $table.riskRewardRatio,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rMultiple =>
      $composableBuilder(column: $table.rMultiple, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get outcome =>
      $composableBuilder(column: $table.outcome, builder: (column) => column);

  GeneratedColumn<String> get account =>
      $composableBuilder(column: $table.account, builder: (column) => column);

  GeneratedColumn<String> get entryReason => $composableBuilder(
    column: $table.entryReason,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exitReason => $composableBuilder(
    column: $table.exitReason,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emotionalState => $composableBuilder(
    column: $table.emotionalState,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get ruleFollowed => $composableBuilder(
    column: $table.ruleFollowed,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mistakes =>
      $composableBuilder(column: $table.mistakes, builder: (column) => column);

  GeneratedColumn<String> get lessonsLearned => $composableBuilder(
    column: $table.lessonsLearned,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tagsJson =>
      $composableBuilder(column: $table.tagsJson, builder: (column) => column);

  GeneratedColumn<String> get screenshotPath => $composableBuilder(
    column: $table.screenshotPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TradesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TradesTableTable,
          TradesTableData,
          $$TradesTableTableFilterComposer,
          $$TradesTableTableOrderingComposer,
          $$TradesTableTableAnnotationComposer,
          $$TradesTableTableCreateCompanionBuilder,
          $$TradesTableTableUpdateCompanionBuilder,
          (
            TradesTableData,
            BaseReferences<_$AppDatabase, $TradesTableTable, TradesTableData>,
          ),
          TradesTableData,
          PrefetchHooks Function()
        > {
  $$TradesTableTableTableManager(_$AppDatabase db, $TradesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TradesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TradesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TradesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> tradeDate = const Value.absent(),
                Value<String> symbol = const Value.absent(),
                Value<String> market = const Value.absent(),
                Value<String> direction = const Value.absent(),
                Value<double> entryPrice = const Value.absent(),
                Value<double?> exitPrice = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<double> contractMultiplier = const Value.absent(),
                Value<String> strategy = const Value.absent(),
                Value<String?> setup = const Value.absent(),
                Value<double?> stopLoss = const Value.absent(),
                Value<double?> takeProfit = const Value.absent(),
                Value<String?> entryTime = const Value.absent(),
                Value<String?> exitTime = const Value.absent(),
                Value<String?> tradingSession = const Value.absent(),
                Value<String?> timeframe = const Value.absent(),
                Value<double> brokerage = const Value.absent(),
                Value<double> exchangeFees = const Value.absent(),
                Value<double> spreadCommission = const Value.absent(),
                Value<double> otherCosts = const Value.absent(),
                Value<double> totalCosts = const Value.absent(),
                Value<double> grossPnL = const Value.absent(),
                Value<double> netPnL = const Value.absent(),
                Value<double?> riskRewardRatio = const Value.absent(),
                Value<double?> rMultiple = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> outcome = const Value.absent(),
                Value<String> account = const Value.absent(),
                Value<String?> entryReason = const Value.absent(),
                Value<String?> exitReason = const Value.absent(),
                Value<String?> emotionalState = const Value.absent(),
                Value<bool> ruleFollowed = const Value.absent(),
                Value<String?> mistakes = const Value.absent(),
                Value<String?> lessonsLearned = const Value.absent(),
                Value<String> tagsJson = const Value.absent(),
                Value<String?> screenshotPath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TradesTableCompanion(
                id: id,
                tradeDate: tradeDate,
                symbol: symbol,
                market: market,
                direction: direction,
                entryPrice: entryPrice,
                exitPrice: exitPrice,
                quantity: quantity,
                contractMultiplier: contractMultiplier,
                strategy: strategy,
                setup: setup,
                stopLoss: stopLoss,
                takeProfit: takeProfit,
                entryTime: entryTime,
                exitTime: exitTime,
                tradingSession: tradingSession,
                timeframe: timeframe,
                brokerage: brokerage,
                exchangeFees: exchangeFees,
                spreadCommission: spreadCommission,
                otherCosts: otherCosts,
                totalCosts: totalCosts,
                grossPnL: grossPnL,
                netPnL: netPnL,
                riskRewardRatio: riskRewardRatio,
                rMultiple: rMultiple,
                status: status,
                outcome: outcome,
                account: account,
                entryReason: entryReason,
                exitReason: exitReason,
                emotionalState: emotionalState,
                ruleFollowed: ruleFollowed,
                mistakes: mistakes,
                lessonsLearned: lessonsLearned,
                tagsJson: tagsJson,
                screenshotPath: screenshotPath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime tradeDate,
                required String symbol,
                required String market,
                required String direction,
                required double entryPrice,
                Value<double?> exitPrice = const Value.absent(),
                required double quantity,
                Value<double> contractMultiplier = const Value.absent(),
                required String strategy,
                Value<String?> setup = const Value.absent(),
                Value<double?> stopLoss = const Value.absent(),
                Value<double?> takeProfit = const Value.absent(),
                Value<String?> entryTime = const Value.absent(),
                Value<String?> exitTime = const Value.absent(),
                Value<String?> tradingSession = const Value.absent(),
                Value<String?> timeframe = const Value.absent(),
                Value<double> brokerage = const Value.absent(),
                Value<double> exchangeFees = const Value.absent(),
                Value<double> spreadCommission = const Value.absent(),
                Value<double> otherCosts = const Value.absent(),
                Value<double> totalCosts = const Value.absent(),
                Value<double> grossPnL = const Value.absent(),
                Value<double> netPnL = const Value.absent(),
                Value<double?> riskRewardRatio = const Value.absent(),
                Value<double?> rMultiple = const Value.absent(),
                required String status,
                required String outcome,
                Value<String> account = const Value.absent(),
                Value<String?> entryReason = const Value.absent(),
                Value<String?> exitReason = const Value.absent(),
                Value<String?> emotionalState = const Value.absent(),
                Value<bool> ruleFollowed = const Value.absent(),
                Value<String?> mistakes = const Value.absent(),
                Value<String?> lessonsLearned = const Value.absent(),
                Value<String> tagsJson = const Value.absent(),
                Value<String?> screenshotPath = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => TradesTableCompanion.insert(
                id: id,
                tradeDate: tradeDate,
                symbol: symbol,
                market: market,
                direction: direction,
                entryPrice: entryPrice,
                exitPrice: exitPrice,
                quantity: quantity,
                contractMultiplier: contractMultiplier,
                strategy: strategy,
                setup: setup,
                stopLoss: stopLoss,
                takeProfit: takeProfit,
                entryTime: entryTime,
                exitTime: exitTime,
                tradingSession: tradingSession,
                timeframe: timeframe,
                brokerage: brokerage,
                exchangeFees: exchangeFees,
                spreadCommission: spreadCommission,
                otherCosts: otherCosts,
                totalCosts: totalCosts,
                grossPnL: grossPnL,
                netPnL: netPnL,
                riskRewardRatio: riskRewardRatio,
                rMultiple: rMultiple,
                status: status,
                outcome: outcome,
                account: account,
                entryReason: entryReason,
                exitReason: exitReason,
                emotionalState: emotionalState,
                ruleFollowed: ruleFollowed,
                mistakes: mistakes,
                lessonsLearned: lessonsLearned,
                tagsJson: tagsJson,
                screenshotPath: screenshotPath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TradesTableTable, TradesTableData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $TradesTableTable,
                    TradesTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TradesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TradesTableTable,
      TradesTableData,
      $$TradesTableTableFilterComposer,
      $$TradesTableTableOrderingComposer,
      $$TradesTableTableAnnotationComposer,
      $$TradesTableTableCreateCompanionBuilder,
      $$TradesTableTableUpdateCompanionBuilder,
      (
        TradesTableData,
        BaseReferences<_$AppDatabase, $TradesTableTable, TradesTableData>,
      ),
      TradesTableData,
      PrefetchHooks Function()
    >;
typedef $$StrategiesTableTableCreateCompanionBuilder =
    StrategiesTableCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<String> colorHex,
      Value<String> market,
      Value<bool> isArchived,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$StrategiesTableTableUpdateCompanionBuilder =
    StrategiesTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String> colorHex,
      Value<String> market,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$StrategiesTableTableFilterComposer
    extends Composer<_$AppDatabase, $StrategiesTableTable> {
  $$StrategiesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get market => $composableBuilder(
    column: $table.market,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StrategiesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StrategiesTableTable> {
  $$StrategiesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get market => $composableBuilder(
    column: $table.market,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StrategiesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StrategiesTableTable> {
  $$StrategiesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<String> get market =>
      $composableBuilder(column: $table.market, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$StrategiesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StrategiesTableTable,
          StrategiesTableData,
          $$StrategiesTableTableFilterComposer,
          $$StrategiesTableTableOrderingComposer,
          $$StrategiesTableTableAnnotationComposer,
          $$StrategiesTableTableCreateCompanionBuilder,
          $$StrategiesTableTableUpdateCompanionBuilder,
          (
            StrategiesTableData,
            BaseReferences<
              _$AppDatabase,
              $StrategiesTableTable,
              StrategiesTableData
            >,
          ),
          StrategiesTableData,
          PrefetchHooks Function()
        > {
  $$StrategiesTableTableTableManager(
    _$AppDatabase db,
    $StrategiesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StrategiesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StrategiesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StrategiesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> colorHex = const Value.absent(),
                Value<String> market = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StrategiesTableCompanion(
                id: id,
                name: name,
                description: description,
                colorHex: colorHex,
                market: market,
                isArchived: isArchived,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String> colorHex = const Value.absent(),
                Value<String> market = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => StrategiesTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                colorHex: colorHex,
                market: market,
                isArchived: isArchived,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StrategiesTableTable, StrategiesTableData>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $StrategiesTableTable,
                    StrategiesTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StrategiesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StrategiesTableTable,
      StrategiesTableData,
      $$StrategiesTableTableFilterComposer,
      $$StrategiesTableTableOrderingComposer,
      $$StrategiesTableTableAnnotationComposer,
      $$StrategiesTableTableCreateCompanionBuilder,
      $$StrategiesTableTableUpdateCompanionBuilder,
      (
        StrategiesTableData,
        BaseReferences<
          _$AppDatabase,
          $StrategiesTableTable,
          StrategiesTableData
        >,
      ),
      StrategiesTableData,
      PrefetchHooks Function()
    >;
typedef $$DailyReviewsTableTableCreateCompanionBuilder =
    DailyReviewsTableCompanion Function({
      required String id,
      required DateTime reviewDate,
      Value<String> reflection,
      Value<int> disciplineScore,
      Value<String?> mistakes,
      Value<String?> lessonsLearned,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$DailyReviewsTableTableUpdateCompanionBuilder =
    DailyReviewsTableCompanion Function({
      Value<String> id,
      Value<DateTime> reviewDate,
      Value<String> reflection,
      Value<int> disciplineScore,
      Value<String?> mistakes,
      Value<String?> lessonsLearned,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$DailyReviewsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DailyReviewsTableTable> {
  $$DailyReviewsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get reviewDate => $composableBuilder(
    column: $table.reviewDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reflection => $composableBuilder(
    column: $table.reflection,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get disciplineScore => $composableBuilder(
    column: $table.disciplineScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mistakes => $composableBuilder(
    column: $table.mistakes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lessonsLearned => $composableBuilder(
    column: $table.lessonsLearned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyReviewsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyReviewsTableTable> {
  $$DailyReviewsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get reviewDate => $composableBuilder(
    column: $table.reviewDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reflection => $composableBuilder(
    column: $table.reflection,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get disciplineScore => $composableBuilder(
    column: $table.disciplineScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mistakes => $composableBuilder(
    column: $table.mistakes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lessonsLearned => $composableBuilder(
    column: $table.lessonsLearned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyReviewsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyReviewsTableTable> {
  $$DailyReviewsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get reviewDate => $composableBuilder(
    column: $table.reviewDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reflection => $composableBuilder(
    column: $table.reflection,
    builder: (column) => column,
  );

  GeneratedColumn<int> get disciplineScore => $composableBuilder(
    column: $table.disciplineScore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mistakes =>
      $composableBuilder(column: $table.mistakes, builder: (column) => column);

  GeneratedColumn<String> get lessonsLearned => $composableBuilder(
    column: $table.lessonsLearned,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DailyReviewsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyReviewsTableTable,
          DailyReviewsTableData,
          $$DailyReviewsTableTableFilterComposer,
          $$DailyReviewsTableTableOrderingComposer,
          $$DailyReviewsTableTableAnnotationComposer,
          $$DailyReviewsTableTableCreateCompanionBuilder,
          $$DailyReviewsTableTableUpdateCompanionBuilder,
          (
            DailyReviewsTableData,
            BaseReferences<
              _$AppDatabase,
              $DailyReviewsTableTable,
              DailyReviewsTableData
            >,
          ),
          DailyReviewsTableData,
          PrefetchHooks Function()
        > {
  $$DailyReviewsTableTableTableManager(
    _$AppDatabase db,
    $DailyReviewsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyReviewsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyReviewsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyReviewsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> reviewDate = const Value.absent(),
                Value<String> reflection = const Value.absent(),
                Value<int> disciplineScore = const Value.absent(),
                Value<String?> mistakes = const Value.absent(),
                Value<String?> lessonsLearned = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyReviewsTableCompanion(
                id: id,
                reviewDate: reviewDate,
                reflection: reflection,
                disciplineScore: disciplineScore,
                mistakes: mistakes,
                lessonsLearned: lessonsLearned,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime reviewDate,
                Value<String> reflection = const Value.absent(),
                Value<int> disciplineScore = const Value.absent(),
                Value<String?> mistakes = const Value.absent(),
                Value<String?> lessonsLearned = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => DailyReviewsTableCompanion.insert(
                id: id,
                reviewDate: reviewDate,
                reflection: reflection,
                disciplineScore: disciplineScore,
                mistakes: mistakes,
                lessonsLearned: lessonsLearned,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DailyReviewsTableTable, DailyReviewsTableData>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $DailyReviewsTableTable,
                    DailyReviewsTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyReviewsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyReviewsTableTable,
      DailyReviewsTableData,
      $$DailyReviewsTableTableFilterComposer,
      $$DailyReviewsTableTableOrderingComposer,
      $$DailyReviewsTableTableAnnotationComposer,
      $$DailyReviewsTableTableCreateCompanionBuilder,
      $$DailyReviewsTableTableUpdateCompanionBuilder,
      (
        DailyReviewsTableData,
        BaseReferences<
          _$AppDatabase,
          $DailyReviewsTableTable,
          DailyReviewsTableData
        >,
      ),
      DailyReviewsTableData,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsTableTableCreateCompanionBuilder =
    AppSettingsTableCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$AppSettingsTableTableUpdateCompanionBuilder =
    AppSettingsTableCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$AppSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppSettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTableTable,
          AppSettingsTableData,
          $$AppSettingsTableTableFilterComposer,
          $$AppSettingsTableTableOrderingComposer,
          $$AppSettingsTableTableAnnotationComposer,
          $$AppSettingsTableTableCreateCompanionBuilder,
          $$AppSettingsTableTableUpdateCompanionBuilder,
          (
            AppSettingsTableData,
            BaseReferences<
              _$AppDatabase,
              $AppSettingsTableTable,
              AppSettingsTableData
            >,
          ),
          AppSettingsTableData,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableTableManager(
    _$AppDatabase db,
    $AppSettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => AppSettingsTableCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsTableCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AppSettingsTableTable, AppSettingsTableData>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $AppSettingsTableTable,
                    AppSettingsTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTableTable,
      AppSettingsTableData,
      $$AppSettingsTableTableFilterComposer,
      $$AppSettingsTableTableOrderingComposer,
      $$AppSettingsTableTableAnnotationComposer,
      $$AppSettingsTableTableCreateCompanionBuilder,
      $$AppSettingsTableTableUpdateCompanionBuilder,
      (
        AppSettingsTableData,
        BaseReferences<
          _$AppDatabase,
          $AppSettingsTableTable,
          AppSettingsTableData
        >,
      ),
      AppSettingsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TradesTableTableTableManager get tradesTable =>
      $$TradesTableTableTableManager(_db, _db.tradesTable);
  $$StrategiesTableTableTableManager get strategiesTable =>
      $$StrategiesTableTableTableManager(_db, _db.strategiesTable);
  $$DailyReviewsTableTableTableManager get dailyReviewsTable =>
      $$DailyReviewsTableTableTableManager(_db, _db.dailyReviewsTable);
  $$AppSettingsTableTableTableManager get appSettingsTable =>
      $$AppSettingsTableTableTableManager(_db, _db.appSettingsTable);
}
