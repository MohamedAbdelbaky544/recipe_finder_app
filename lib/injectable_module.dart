import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dioInstance {
    final dio = Dio(
      BaseOptions(
        headers: {
          // 'Content-Type': 'application/json',
          'Accept': '*/*',
          // 'clientTZ': 'Asia/Dubai',
        },
        validateStatus: (statusCode) {
          if (statusCode != null) {
            if (200 <= statusCode && statusCode < 300) {
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        },
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          // if (error.response?.statusCode == 401) {}
          print('-------------------------');
          print(error.error);
          print(error.message);
          print('-------------------------');

          return handler.next(error);
        },
        onRequest: (request, handler) async {
          request.sendTimeout = (request.data is FormData)
              ? const Duration(milliseconds: 300000)
              : const Duration(milliseconds: 60000);
          request.connectTimeout = const Duration(milliseconds: 5000);
          request.receiveTimeout = const Duration(milliseconds: 60000);

          return handler.next(request);
        },
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        logPrint: (obj) {
          debugPrint(obj.toString());
        },
      ),
    );
    dio.interceptors.add(CurlLoggerDioInterceptor());
    return dio;
  }

  @lazySingleton
  Logger get logger => Logger();
}
