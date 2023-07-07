import 'package:flutter/material.dart';
import 'package:plusvalia/screens/agregar_inversion/agregar_inversion.dart';
import 'package:plusvalia/screens/authentication_screen/authentication_screen.dart';
import 'package:plusvalia/screens/home_screen/home_screen.dart';
import 'package:plusvalia/screens/splash_screen/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return _pageRouteBuilder(screen: SplashScreen());
      case '/authentication':
        return _pageRouteBuilder(screen: AuthenticationScreen());
      case '/home':
        return _pageRouteBuilder(screen: HomeScreen());
      case '/agregar_inersion':
        return _pageRouteBuilder(screen: AgregarInversion());
      default:
        return null;
    }
  }

  _pageRouteBuilder({required dynamic screen}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => screen,
      transitionDuration: Duration.zero,
    );
  }
}
