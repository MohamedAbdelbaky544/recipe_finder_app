// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:recipe_finder_app/home/data/data_source/reomte/product_remote_data_source.dart'
    as _i255;
import 'package:recipe_finder_app/home/data/repository/product_repository_impl.dart'
    as _i629;
import 'package:recipe_finder_app/home/domain/repository/product_repository.dart'
    as _i154;
import 'package:recipe_finder_app/home/domain/use_cases/get_meal_by_id.dart'
    as _i804;
import 'package:recipe_finder_app/home/domain/use_cases/get_random_meal_use_case.dart'
    as _i971;
import 'package:recipe_finder_app/home/presentation/controller/get_random_meal_controller.dart'
    as _i467;
import 'package:recipe_finder_app/injectable_module.dart' as _i343;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dioInstance);
    gh.lazySingleton<_i974.Logger>(() => injectableModule.logger);
    gh.lazySingleton<_i255.ProductRemoteDataSource>(
      () => _i255.ProductRemoteDataSourceImpl.new(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i154.ProductRepository>(
      () => _i629.ProductRepositoryImpl(
        gh<_i974.Logger>(),
        gh<_i255.ProductRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i804.GetMealById>(
      () => _i804.GetMealById(gh<_i154.ProductRepository>()),
    );
    gh.lazySingleton<_i971.GetRandomMealUseCase>(
      () => _i971.GetRandomMealUseCase(gh<_i154.ProductRepository>()),
    );
    gh.factory<_i467.GetRandomMealController>(
      () => _i467.GetRandomMealController(
        useCase: gh<_i971.GetRandomMealUseCase>(),
      ),
    );
    return this;
  }
}

class _$InjectableModule extends _i343.InjectableModule {}
