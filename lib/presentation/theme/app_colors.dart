import 'package:flutter/material.dart';

class AppColors {
  Color get appColor => "#7633FF".toColor();

  Color get greenColor => "#0C9F2C".toColor();

  Color get redColor => "#FF0000".toColor();

  Color get chipColor => "#DAD8D8".toColor();


  Color get primary => Colors.black;

  Color get whiteColor => Colors.white;

  Color get hintColor => Colors.grey.shade700;

  Color get splashLoader => Colors.green;

  Color get background => Colors.green.shade100;




  Color get textFormFieldColor => Colors.grey.shade600;
}

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
