import 'package:flutter/material.dart';

extension ImagePath on BuildContext {
  Future navigateReplacedNamed( String route, {dynamic arguments}) {
    return Navigator.pushReplacementNamed(this, route, arguments: arguments);
  }

  Future navigateNamed( String route, {dynamic arguments}) {
    return Navigator.pushNamed(this, route, arguments: arguments);
  }

}
