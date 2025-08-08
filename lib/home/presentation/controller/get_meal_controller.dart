import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder_app/home/domain/entities/meal.dart';
import 'package:recipe_finder_app/home/domain/use_cases/get_meal_by_id.dart';
import 'package:recipe_finder_app/injection.dart';

final GetFutureMealDetails =
    ChangeNotifierProvider.family<GetMealDetailsController, String>(
      (res, id) =>
          GetMealDetailsController(useCase: getIt<GetMealById>(), id: id),
    );

class GetMealDetailsController extends ChangeNotifier {
  final GetMealById useCase;
  Meal? mealData;
  String? error;
  final String id;

  GetMealDetailsController({required this.useCase, required this.id}) {
    getData(id: id);
  }

  Future getData({required String id}) async {
    mealData = null;
    error = null;
    notifyListeners();

    final result = await useCase.call(id);

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
