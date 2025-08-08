import 'package:flutter/material.dart';
import 'package:recipe_finder_app/core/presentation/themes/material_colors.dart';

abstract class AppColorScheme {
  Brightness get brightness;
  MaterialPrimaryColor get primaryColor;

  MaterialTextColor get textColor;

  Color get secondaryColor => const Color(0xffA4A4A4);

  Color get whiteColor => Colors.white;

  Color get shadowColor => const Color(0xff1D617A);

  Color get blackColor => const Color(0xff212121);

  Color get darkGreyColor => const Color(0xff626262);

  Color get greyColor => const Color(0xffA4A4A4);

  Color get grey => const Color(0xffbdbdbd);

  Color get dynamicGrey => const Color(0xff1E2022);

  Color get greyColorForBorder => const Color(0xffE0E0E0);

  Color get backgroundColor => const Color(0xffF5F5F5);

  Color get dividerColor => const Color(0xff0E0E0E).withOpacity(0.12);

  Color get greyForSignature => const Color(0xffEEEEEE);

  Color get errorColor => const Color(0xffB71C1C);

  Color get successColor => const Color(0xff2E7D32);

  Map<StatusColor, Color> get status;
}

class AppLightColors extends AppColorScheme {
  @override
  Brightness get brightness => Brightness.light;

  @override
  Map<StatusColor, Color> get status => {
    StatusColor.orange: const Color(0xffEF6C00),
    StatusColor.blue: const Color(0xff1A6E92),
    StatusColor.green: Colors.green,
    StatusColor.red: const Color(0xffB71C1C),
    StatusColor.orangeTint: const Color(0xffEF6C00).withValues(alpha: 0.1),
    StatusColor.redTint: const Color(0xffB71C1C).withValues(alpha: 0.1),
    StatusColor.blueTint: const Color(0xff1A6E92).withValues(alpha: 0.1),
    StatusColor.greenTint: Colors.green.withValues(alpha: 0.1),
  };

  @override
  MaterialTextColor get textColor =>
      const MaterialTextColor(0xff212121, <TextColor, Color>{
        TextColor.white: Colors.white,
        TextColor.grey: Color(0xffbdbdbd),
        TextColor.dynamicGrey: Color(0xffE5E5E5),
        TextColor.darkGrey: Color(0xff626262),
        TextColor.lightGrey: Color(0xffE5E5E5),
      });

  @override
  MaterialPrimaryColor get primaryColor =>
      MaterialPrimaryColor(0xff1A6E92, <PrimaryColor, Color>{
        PrimaryColor.tint: const Color.fromARGB(
          255,
          13,
          22,
          25,
        ).withValues(alpha: 0.1),
      });
}
