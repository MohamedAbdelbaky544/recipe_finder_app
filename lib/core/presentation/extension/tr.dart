import 'package:flutter/material.dart';
import 'package:recipe_finder_app/core/presentation/utils/generated/translation/translations.dart';

extension Translation on BuildContext {
  Translations get translation => Translations.of(this)!;
}
