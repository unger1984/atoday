import 'package:atoday/services/providers/preferences_provider.dart';

abstract class SettingsRepository {
  final PreferencesProvider preferencesProvider;
  String? _token;

  SettingsRepository({required this.preferencesProvider});

  Future<void> initialize();
  String? get token => _token;
  set token(String? value) => _token = value;
}
