import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/app_settings_model.dart';
import '../database/database.dart';

import 'package:drift/drift.dart';

class SettingsRepository {
  final AppDatabase _db;
  final SharedPreferences _prefs;
  static const String _settingsPrefKey = 'app_settings_json';

  SettingsRepository(this._db, this._prefs);

  Future<AppSettingsModel> getSettings() async {
    // Try SharedPreferences first for instant speed
    final jsonStr = _prefs.getString(_settingsPrefKey);
    if (jsonStr != null) {
      try {
        final map = jsonDecode(jsonStr) as Map<String, dynamic>;
        return AppSettingsModel.fromJson(map);
      } catch (_) {}
    }

    // Fallback to SQLite table
    final row = await (_db.select(
      _db.appSettingsTable,
    )..where((s) => s.key.equals('settings'))).getSingleOrNull();

    if (row != null) {
      try {
        final map = jsonDecode(row.value) as Map<String, dynamic>;
        final model = AppSettingsModel.fromJson(map);
        await _prefs.setString(_settingsPrefKey, jsonEncode(model.toJson()));
        return model;
      } catch (_) {}
    }

    const defaultSettings = AppSettingsModel();
    await saveSettings(defaultSettings);
    return defaultSettings;
  }

  Future<void> saveSettings(AppSettingsModel settings) async {
    final jsonStr = jsonEncode(settings.toJson());
    await _prefs.setString(_settingsPrefKey, jsonStr);

    await _db
        .into(_db.appSettingsTable)
        .insertOnConflictUpdate(
          AppSettingsTableCompanion(
            key: const Value('settings'),
            value: Value(jsonStr),
          ),
        );
  }
}
