import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_finder_app/core/domain/entities/failure.dart';
import 'package:recipe_finder_app/core/domain/use_cases/use_cases.dart';
import 'package:recipe_finder_app/home/domain/entities/meal.dart';
import 'package:recipe_finder_app/home/domain/repository/product_repository.dart';

@lazySingleton
class GetMealById extends UseCase<Meal, String> {
  ProductRepository repository;
  GetMealById(this.repository);

  @override
  Future<Either<Failure, Meal>> call(String params) {
    return repository.getMeal(id: params);
  }
}
