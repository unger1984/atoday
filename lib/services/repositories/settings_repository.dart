import 'package:atoday/services/providers/preferences_provider.dart';

abstract class SettingsRepository {
  final PreferencesProvider preferencesProvider;
  String? _token;
  int? _userId;

  SettingsRepository({required this.preferencesProvider});

  Future<void> initialize();
  String? get token => _token;
  set token(String? value) => _token = value;
  int? get userId => _userId;
  set userId(int? value) => _userId = value;
}
