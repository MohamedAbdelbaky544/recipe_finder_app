import 'package:flutter/material.dart';
import 'package:recipe_finder_app/core/presentation/themes/app_color_scheme.dart';
import 'package:recipe_finder_app/core/presentation/themes/app_theme.dart';

extension ThemeApp on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ThemeData get theme => Theme.of(this);

  AppColorScheme get appColor => Theme.of(this).appColors;

  Color get primaryColor => Theme.of(this).primaryColor;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
