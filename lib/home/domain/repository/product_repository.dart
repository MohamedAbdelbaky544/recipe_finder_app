import 'package:dartz/dartz.dart';
import 'package:recipe_finder_app/core/domain/entities/failure.dart';
import 'package:recipe_finder_app/home/domain/entities/meal.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Meal>>> getRandomMeal({required String search});
  Future<Either<Failure, Meal>> getMeal({required String id});
}
