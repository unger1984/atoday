abstract class PreferencesProvider {
  Future<void> initialize();
  // ignore: no-object-declaration
  Object? get(String key);
  String? getString(String key);
  int? getInt(String key);
  double? getDouble(String key);
  bool? getBool(String key);
  Future<bool> setString(String key, String value);
  Future<bool> setInt(String key, int value);
  Future<bool> setDouble(String key, double value);
  Future<bool> setBool(String key, bool value);
  Future<bool> remove(String key);
  Future<bool> clear();
}
