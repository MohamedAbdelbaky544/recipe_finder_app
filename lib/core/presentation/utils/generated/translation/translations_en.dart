// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'translations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class TranslationsEn extends Translations {
  TranslationsEn([String locale = 'en']) : super(locale);

  @override
  String get searchRecipes => 'Search recipes';

  @override
  String get result => 'result';

  @override
  String get recipe => 'Recipe';

  @override
  String get ingredients => 'Ingredients';
}
