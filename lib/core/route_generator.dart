import 'package:flutter/material.dart';

import 'package:wynd_test/constants/route_names.dart';
import 'package:wynd_test/core/error_page.dart';
import 'package:wynd_test/models/post.dart';
import 'package:wynd_test/screens/home/home_page.dart';
import 'package:wynd_test/screens/post/post_detail_page.dart';
import 'package:wynd_test/screens/splashscreen/splashscreen_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    final name = settings.name;

    switch (name) {
      case RouteName.initial:
        return MaterialPageRoute(builder: (_) => const SplashscreenPage());
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => HomePage());

      case RouteName.postDetail:
        return MaterialPageRoute(builder: (_) => PostDetailPage(args as Post));

      default:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }
}
