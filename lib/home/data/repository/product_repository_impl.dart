import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_finder_app/core/data/repositories/base_repository_impl.dart';
import 'package:recipe_finder_app/core/domain/entities/failure.dart';
import 'package:recipe_finder_app/home/data/data_source/reomte/product_remote_data_source.dart';
import 'package:recipe_finder_app/home/data/models/meal_model/meal_model.dart';
import 'package:recipe_finder_app/home/domain/entities/meal.dart';
import 'package:recipe_finder_app/home/domain/repository/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl extends BaseRepositoryImpl
    implements ProductRepository {
  final ProductRemoteDataSource remote;
  ProductRepositoryImpl(super.logger, this.remote);

  @override
  Future<Either<Failure, Meal>> getMeal({required String id}) {
    return request(() async {
      final result = await remote.getMeal(id: id);
      return right(result.meals!.map((e) => e.toDomain()).first);
    });
  }

  @override
  Future<Either<Failure, List<Meal>>> getRandomMeal({required String search}) {
    return request(() async {
      final result = await remote.getRandomMeal(s: search);
      return right(result.meals!.map((e) => e.toDomain()).toList());
    });
  }
}
