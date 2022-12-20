import 'package:flutter/material.dart';

import 'package:wynd_test/constants/route_names.dart';
import 'package:wynd_test/core/error_page.dart';
import 'package:wynd_test/screens/home/home_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    final name = settings.name;

    switch (name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => HomePage());

      default:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }
}
