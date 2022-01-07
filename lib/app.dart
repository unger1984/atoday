import 'package:arctium/arctium.dart';
import 'package:atoday/blocs/init_bloc.dart';
import 'package:atoday/services/providers/api_provider.dart';
import 'package:atoday/services/repositories/settings_repository.dart';
import 'package:atoday/ui/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) => super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              'App StatefulWidget',
            ),
          ),
      );
}

class _AppState extends State<App> {
  final _initBLoC = InitBLoC(
    settingsRepository: Arctium.instance.get<SettingsRepository>(),
    apiProvider: Arctium.instance.get<ApiProvider>(),
  );

  // void _init() {
  //   _initBLoC.add(const InitInitEvent());
  // }
  //
  // @override
  // void initState() {
  //   Future.delayed(Duration.zero, _init);
  //   super.initState();
  // }

  @override
  void dispose() {
    _initBLoC.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider.value(
        value: _initBLoC,
        child: BlocBuilder<InitBLoC, InitState>(
          builder: (context, state) {
            if (state is ErrorInitState || state is LoginInitState) {
              return const LoginScreen();
            } else if (state is SuccessInitState) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _initBLoC.add(const LogoutInitEvent());
                    },
                    child: const Text('SUCCESS'),
                  ),
                ),
              );
            }

            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) => super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              '_AppState State<App>',
            ),
          ),
      );
}
