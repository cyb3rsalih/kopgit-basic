import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kopgit_basic/main.dart';
import 'package:kopgit_basic/single.dart';

import 'error_page.dart';

class RouteGenerator {
  static Route<dynamic>? _rotaOlustur(
      Widget gidilecekWidget, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
          builder: (context) => gidilecekWidget, settings: settings);
    }

    return CupertinoPageRoute(
        builder: (context) => gidilecekWidget, settings: settings);
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _rotaOlustur(const MainScreen(), settings);
      case '/single':
        return _rotaOlustur(SinglePage(), settings);
      default:
        return _rotaOlustur(const ErrorPage(), settings);
    }
  }
}
