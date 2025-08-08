import 'package:injectable/injectable.dart';
import 'package:recipe_finder_app/core/data/models/base_response/base_response.dart';
import 'package:recipe_finder_app/home/data/models/meal_model/meal_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'product_remote_data_source.g.dart';

abstract class ProductRemoteDataSource {
  Future<BaseResponse<List<MealModel>>> getRandomMeal({required String s});
  Future<BaseResponse<List<MealModel>>> getMeal({required String id});
}

@LazySingleton(as: ProductRemoteDataSource)
@RestApi(baseUrl: '')
abstract class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @factoryMethod
  factory ProductRemoteDataSourceImpl(Dio dio) {
    return _ProductRemoteDataSourceImpl(dio);
  }

  @override
  @GET('https://www.themealdb.com/api/json/v1/1/search.php?s={s}')
  Future<BaseResponse<List<MealModel>>> getRandomMeal({
    @Path() required String s,
  });

  @override
  @GET('https://www.themealdb.com/api/json/v1/1/lookup.php?i={id}')
  Future<BaseResponse<List<MealModel>>> getMeal({@Path() required String id});
}
