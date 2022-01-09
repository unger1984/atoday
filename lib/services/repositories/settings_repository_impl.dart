import 'package:atoday/services/providers/preferences_provider.dart';
import 'package:atoday/services/repositories/settings_repository.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  SettingsRepositoryImpl({required PreferencesProvider preferencesProvider})
      : super(preferencesProvider: preferencesProvider);

  @override
  Future<void> initialize() async {
    await preferencesProvider.initialize();
    token = preferencesProvider.getString('token');
    userId = preferencesProvider.getInt('userId');
  }

  @override
  set token(String? value) {
    super.token = value;
    if (value == null) {
      preferencesProvider.remove('token');
    } else {
      preferencesProvider.setString('token', value);
    }
  }

  @override
  set userId(int? value) {
    super.userId = value;
    if (value == null) {
      preferencesProvider.remove('userId');
    } else {
      preferencesProvider.setInt('userId', value);
    }
  }
}
