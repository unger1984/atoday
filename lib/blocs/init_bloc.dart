import 'package:atoday/models/bearer_model.dart';
import 'package:atoday/services/providers/api_provider.dart';
import 'package:atoday/services/providers/api_provider_impl.dart';
import 'package:atoday/services/repositories/settings_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_bloc.freezed.dart';

@freezed
class InitEvent with _$InitEvent {
  const InitEvent._();
  const factory InitEvent.init() = InitInitEvent;
  const factory InitEvent.login(String loginCookie) = LoginInitEvent;
  const factory InitEvent.logout() = LogoutInitEvent;
}

@freezed
class InitState with _$InitState {
  const InitState._();
  const factory InitState.loading() = LoadingInitState;
  const factory InitState.login() = LoginInitState;
  const factory InitState.error() = ErrorInitState;
  const factory InitState.success() = SuccessInitState;
}

class InitBLoC extends Bloc<InitEvent, InitState> {
  final SettingsRepository settingsRepository;
  final ApiProvider apiProvider;

  InitBLoC({required this.settingsRepository, required this.apiProvider}) : super(const LoadingInitState()) {
    on<InitInitEvent>(_init);
    on<LoginInitEvent>(_login);
    on<LogoutInitEvent>(_logout);
    add(const InitInitEvent());
  }

  Future<void> _init(_, Emitter<InitState> emit) async {
    emit(const LoadingInitState());
    await settingsRepository.initialize();
    final token = settingsRepository.token;
    if (token == null) {
      emit(const LoginInitState());
    } else {
      apiProvider.setAuthHeader(token);
      emit(const SuccessInitState());
    }
  }

  Future<void> _login(LoginInitEvent event, Emitter<InitState> emit) async {
    emit(const LoadingInitState());
    final apiTmpProvider = ApiProviderImpl(baseUrl: 'https://author.today');
    final resp = await apiTmpProvider.get<Map<String, dynamic>>(
      '/account/bearer-token',
      options: Options(headers: {'Cookie': 'LoginCookie=${event.loginCookie}'}),
    );
    if (resp != null) {
      final bearer = BearerModel.fromJson(resp);
      apiProvider.setAuthHeader(bearer.token);
      settingsRepository.token = bearer.token;

      // final res = await apiProvider.get<Map<String, dynamic>>('/catalog/search');
      // if (res != null) {
      //   final result = SearchResultModel.fromJson(res);
      //   print(result);
      // }

      emit(const SuccessInitState());
    } else {
      emit(const ErrorInitState());
    }
  }

  Future<void> _logout(_, Emitter<InitState> emit) async {
    emit(const LoadingInitState());
    apiProvider.delAuthHeader();
    settingsRepository.token = null;
    emit(const ErrorInitState());
  }
}
