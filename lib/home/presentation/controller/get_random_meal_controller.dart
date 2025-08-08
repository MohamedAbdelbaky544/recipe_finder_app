import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_finder_app/home/domain/entities/meal.dart';
import 'package:recipe_finder_app/home/domain/use_cases/get_random_meal_use_case.dart';
import 'package:recipe_finder_app/injection.dart';

final GetFutureMeal = ChangeNotifierProvider(
  (res) => getIt<GetRandomMealController>(),
);

@injectable
class GetRandomMealController extends ChangeNotifier {
  final GetRandomMealUseCase useCase;
  List<Meal> mealData = [];
  String? error;

  GetRandomMealController({required this.useCase}) {
    getData(search: 'a');
  }

  Future getData({required String search}) async {
    mealData = [];
    error = null;
    notifyListeners();

    final result = await useCase.call(search);

    result.fold(
      (failure) {
        error = failure.toString();
        notifyListeners();
      },
      (data) {
        mealData = data;
        notifyListeners();
      },
    );
  }
}
