import 'package:book_app/screens/home/home_screen.dart';
import 'package:book_app/screens/login_screen.dart';
import 'package:book_app/screens/splash_screen.dart';
import 'package:book_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class HRoute {
  // disadvantages:
  //  1. can't pass arguments
  //  2. can't use predicate of pushAndRemoveUntil

  static var routes = <String, Widget>{
    '/': const SplashScreen(),
    '/home': const HomeScreen(),
    '/welcome': const WelcomeScreen(),
    '/login': const LoginScreen(),
  };

  static push(BuildContext context, target, [TransitionType? type]) {
    Widget route = _getRoute(target);
    PageRoute pageRoute = _getPageRoute(route, type);
    Navigator.of(context).push(pageRoute);
  }

  static replaceWith(BuildContext context, target, [TransitionType? type]) {
    Widget route = _getRoute(target);
    PageRoute pageRoute = _getPageRoute(route, type);
    Navigator.of(context).pushReplacement(pageRoute);
  }

  static go(BuildContext context, target, [TransitionType? type]) {
    Widget route = _getRoute(target);
    PageRoute pageRoute = _getPageRoute(route, type);
    Navigator.of(context).pushAndRemoveUntil(pageRoute, (route) => false);
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  static Widget _getRoute(var target) {
    Widget? route;
    if (target.runtimeType == String) {
      route = routes[target];
    } else if (target.runtimeType == Widget) {
      route = target;
    }
    return route ?? const RouteNotFound();
  }

  static PageRoute _getPageRoute(Widget route, TransitionType? type) {
    PageRoute? pageRoute;
    if (type == TransitionType.none) {
      pageRoute = PageRouteBuilder(pageBuilder: (context, _, __) => route);
    } else if (type == TransitionType.zoom) {
      pageRoute = CustomPageRouteBuilder(
        pageBuilder: (context, _, __) => route,
        pageTransitionsBuilder: const ZoomPageTransitionsBuilder(),
      );
    } else if (type == TransitionType.cupertino) {
      pageRoute = CustomPageRouteBuilder(
        pageBuilder: (context, _, __) => route,
        pageTransitionsBuilder: const CupertinoPageTransitionsBuilder(),
      );
    } else if (type == TransitionType.fadeUpwards) {
      pageRoute = CustomPageRouteBuilder(
        pageBuilder: (context, _, __) => route,
        pageTransitionsBuilder: const FadeUpwardsPageTransitionsBuilder(),
      );
    } else if (type == TransitionType.openUpwards) {
      pageRoute = CustomPageRouteBuilder(
        pageBuilder: (context, _, __) => route,
        pageTransitionsBuilder: const OpenUpwardsPageTransitionsBuilder(),
      );
    }
    return pageRoute ?? MaterialPageRoute(builder: (_) => route);
  }
}

enum TransitionType { none, zoom, cupertino, fadeUpwards, openUpwards }

class CustomPageRouteBuilder<T> extends PageRouteBuilder<T> {
  final PageTransitionsBuilder pageTransitionsBuilder;

  CustomPageRouteBuilder({
    required RoutePageBuilder pageBuilder,
    required this.pageTransitionsBuilder,
  }) : super(pageBuilder: pageBuilder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return pageTransitionsBuilder.buildTransitions(
        this, context, animation, secondaryAnimation, child);
  }
}

class RouteNotFound extends StatelessWidget {
  const RouteNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Route not found!"),
            ElevatedButton(
              onPressed: () => HRoute.go(context, '/home'),
              child: const Text("Go Home"),
            ),
            ElevatedButton(
              onPressed: () => HRoute.pop(context),
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
