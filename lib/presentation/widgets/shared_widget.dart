import 'package:flutter/material.dart';

class SharedWidget {
  static SizedBox width(double size) => SizedBox(width: size);

  static SizedBox height(double size) => SizedBox(height: size);

  static void errorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ));
  }

  static void successSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ));
  }

  static snackBar(
      {required BuildContext context,
      required Widget content,
      Duration? duration}) {
    var snackBar = SnackBar(
      content: content,
      margin: const EdgeInsets.all(20),
      duration: duration ?? const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
