import 'dart:io';

import 'package:atoday/blocs/init_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

@immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) => super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              'LoginScreen StatefulWidget',
            ),
          ),
      );
}

class _LoginScreenState extends State<LoginScreen> {
  final cookieManager = WebviewCookieManager();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  Future<NavigationDecision> _navigationDelegate(NavigationRequest request) async {
    final gotCookies = await cookieManager.getCookies('https://author.today');
    if (gotCookies.any((element) => element.name == 'LoginCookie')) {
      final cookie = gotCookies.firstWhere((element) => element.name == 'LoginCookie').value;
      BlocProvider.of<InitBLoC>(context).add(LoginInitEvent(cookie));
    } else if (request.url == 'https://author.today/account/login') {
      return NavigationDecision.navigate;
    }

    return NavigationDecision.prevent;
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://author.today/account/login',
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: _navigationDelegate,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) => super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              '_LoginScreenState State<LoginScreen>',
            ),
          ),
      );
}
