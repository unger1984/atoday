import 'package:dio/dio.dart';

abstract class ApiProvider {
  final String baseUrl;
  final List<Interceptor>? interceptors;

  ApiProvider({required this.baseUrl, this.interceptors});

  void delAuthHeader();
  void setAuthHeader(String token);

  Future<T?> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
  Future<T?> post<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
  Future<T?> patch<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}
