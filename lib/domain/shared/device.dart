import 'package:flutter/material.dart';

class DeviceUtils {
  static hideKeyboard(BuildContext context) => FocusScope.of(context).unfocus();
}
