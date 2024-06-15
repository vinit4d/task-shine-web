import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_strings.dart';
import 'app_text_style.dart';
import 'screen_dimens.dart';

class ThemeConfig {
  static late AppColors colors;
  static late ScreenDimens dimens;
  static late AppStrings strings;
  static late AppTextStyle styles;

  static void init(BuildContext context) {
    ScreenDimens.init(context);
    colors = AppColors();
    dimens = ScreenDimens();
    strings = AppStrings();
    styles = AppTextStyle();
  }
}
