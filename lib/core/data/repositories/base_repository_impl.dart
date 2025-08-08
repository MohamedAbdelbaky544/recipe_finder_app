import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'package:recipe_finder_app/core/domain/entities/failure.dart';
import 'package:recipe_finder_app/core/domain/repositories/base_repository.dart';

import '../../domain/entities/enum/server_error_code.dart';

class BaseRepositoryImpl implements BaseRepository {
  final Logger _logger;

  BaseRepositoryImpl(this._logger);

  @override
  Future<Either<Failure, T>> request<T>(
    FutureEitherFailureOrData<T> body,
  ) async {
    try {
      return await body();
    } catch (e) {
      const connectionTimeout = 'connectionTimeout';
      if (e is DioException) {
        if (e.error is SocketException) {
          return left(NetworkFailure());
        } else if (e.type.name == connectionTimeout) {
          return left(NetworkFailure(connectionTimeOut: true));
        }
        _logger.e(e.message, error: e, stackTrace: e.stackTrace);
        var message = '';
        var errorCode = ServerErrorCode.serverError;

        // if (e.response != null) {} //TODO handle request and get proper message for error

        return left(ServerFailure(errorCode: errorCode, message: message));
      } else if (e is Error) {
        _logger.e(e.toString(), error: e, stackTrace: e.stackTrace);
      } else {
        _logger.e(e);
      }

      return left(ServerFailure(errorCode: ServerErrorCode.serverError));
    }
  }

  // ServerErrorCode _getErrorCode(int statusCode) {
  //   switch (statusCode) {
  //     case 401:
  //       return ServerErrorCode.unauthenticated;
  //     case 404:
  //       return ServerErrorCode.notFound;
  //     case 403:
  //       return ServerErrorCode.forbidden;
  //     case 422:
  //       return ServerErrorCode.wrongInput;
  //     default:
  //       return ServerErrorCode.serverError;
  //   }
  // }
}
