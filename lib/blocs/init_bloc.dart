import 'package:arctium/arctium.dart';
import 'package:atoday/models/bearer_model.dart';
import 'package:atoday/services/providers/api_provider.dart';
import 'package:atoday/services/providers/api_provider_impl.dart';
import 'package:atoday/services/repositories/api_repository.dart';
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
    final userId = settingsRepository.userId;
    if (token == null || userId == null) {
      emit(const LoginInitState());
    } else {
      apiProvider.setAuthHeader(token);
      emit(const SuccessInitState());
    }
  }

  String decode(String text, String key, int userId) {
    final code = key.split('').reversed.join('') + '@_@' + userId.toString();
    var res = '';
    for (var index = 0; index < text.length; index++) {
      res += String.fromCharCode(text.codeUnitAt(index) ^ code.codeUnitAt((index % code.length).floor()));
    }

    return res;
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
      settingsRepository.userId = bearer.userId;

      final apiRepository = Arctium.instance.get<ApiRepository>();
      // final res = await apiRepository.search(const SearchQueryModel(ps: 9999));
      // print(res);
      final res1 = await apiRepository.chapters(bookId: 33136);
      // print(res1);
      // final res1 = await apiProvider.get('/work/149640/meta-info');
      res1.forEach((element) {
        if (element.text.isNotEmpty && element.key.isNotEmpty) {
          print(decode(element.text, element.key, bearer.userId));
        } else {
          print(element.message);
        }
      });
      // print(res1);

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
