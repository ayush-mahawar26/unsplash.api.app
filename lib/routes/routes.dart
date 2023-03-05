import 'package:flutter/material.dart';
import 'package:unsplash_api/presentation/home.dart';

class AppRoutes {
  Route? routers(RouteSettings settings) {
    switch (settings.name) {
      case ("/home"):
        return MaterialPageRoute(builder: (context) => HomeScr());
    }
  }
}
