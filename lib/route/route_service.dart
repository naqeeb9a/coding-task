import 'package:flutter/material.dart';

class RouteService {
  static replace(BuildContext context, Widget page) {
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }
}
