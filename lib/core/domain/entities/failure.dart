import 'package:recipe_finder_app/core/domain/entities/enum/server_error_code.dart';

abstract class Failure {}

class ServerFailure implements Failure {
  final String message;
  final ServerErrorCode errorCode;
  ServerFailure({required this.errorCode, this.message = ''});
}

class NetworkFailure implements Failure {
  final bool connectionTimeOut;
  NetworkFailure({this.connectionTimeOut = false});
}
