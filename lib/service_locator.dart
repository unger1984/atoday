import 'package:arctium/arctium.dart';
import 'package:atoday/services/providers/api_provider.dart';
import 'package:atoday/services/providers/api_provider_impl.dart';
import 'package:atoday/services/providers/preferences_provider.dart';
import 'package:atoday/services/providers/preferences_provider_impl.dart';
import 'package:atoday/services/repositories/api_repository.dart';
import 'package:atoday/services/repositories/api_repository_impl.dart';
import 'package:atoday/services/repositories/settings_repository.dart';
import 'package:atoday/services/repositories/settings_repository_impl.dart';

void registerServices() {
  final preferencesProvider = PreferencesProviderImpl();
  final apiProvider = ApiProviderImpl(baseUrl: 'https://api.author.today/v1');
  Arctium.instance.register<PreferencesProvider>(preferencesProvider);
  Arctium.instance.register<SettingsRepository>(SettingsRepositoryImpl(preferencesProvider: preferencesProvider));
  Arctium.instance.register<ApiProvider>(apiProvider);
  Arctium.instance.register<ApiRepository>(ApiRepositoryImpl(apiProvider: apiProvider));
}
