import 'package:flutter/material.dart';

class ScreenDimens {
  static late Size size;

  static Future<void> init(BuildContext context) async {
    size = MediaQuery.sizeOf(context);
  }

  double get width => size.width;

  double get height => size.height;

  double get font08 => size.width / 44;

  double get font09 => size.width / 38;

  double get font10 => size.width / 35;

  double get font12 => size.width / 30;

  double get font13 => size.width / 27;

  double get font14 => size.width / 25;

  double get font16 => size.width / 22.5;

  double get font18 => size.width / 20;

  double get font20 => size.width / 18;

  double get font22 => size.width / 16;

  double get font24 => size.width / 14;

  double get font26 => size.width / 12;

  double get font28 => size.width / 10;

  double get d18 => 18;

  double get d16 => 16;

  double get d10 => 10;

  double get d8 => 8;
}
