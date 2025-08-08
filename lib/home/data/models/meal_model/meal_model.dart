import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_finder_app/home/domain/entities/meal.dart';

part 'meal_model.g.dart';

@JsonSerializable()
class MealModel {
  final String idMeal;
  final String strMeal;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strYoutube;

  MealModel({
    required this.idMeal,
    required this.strMeal,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strYoutube,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) =>
      _$MealModelFromJson(json);
}

extension MapToDomain on MealModel {
  Meal toDomain() => Meal(
    idMeal: idMeal,
    strMeal: strMeal,
    strCategory: strCategory,
    strArea: strArea,
    strInstructions: strInstructions,
    strMealThumb: strMealThumb,
    strYoutube: strYoutube,
  );
}
