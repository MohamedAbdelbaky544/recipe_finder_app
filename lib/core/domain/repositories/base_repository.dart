import 'package:dartz/dartz.dart';
import 'package:recipe_finder_app/core/domain/entities/failure.dart';

typedef FutureEitherFailureOrData<T> = Future<Either<Failure, T>> Function();

abstract class BaseRepository {
  Future<Either<Failure, T>> request<T>(FutureEitherFailureOrData<T> body);
}
