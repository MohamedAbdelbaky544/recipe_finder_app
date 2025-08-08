import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_finder_app/core/domain/entities/failure.dart';
import 'package:recipe_finder_app/core/domain/use_cases/use_cases.dart';
import 'package:recipe_finder_app/home/domain/entities/meal.dart';
import 'package:recipe_finder_app/home/domain/repository/product_repository.dart';

@lazySingleton
class GetRandomMealUseCase extends UseCase<List<Meal>, String> {
  ProductRepository repository;
  GetRandomMealUseCase(this.repository);

  @override
  Future<Either<Failure, List<Meal>>> call(String params) {
    return repository.getRandomMeal(search: params);
  }
}
