import 'package:book_app/screens/home/home_screen.dart';
import 'package:book_app/screens/login_screen.dart';
import 'package:book_app/screens/splash_screen.dart';
import 'package:book_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class HRoute {
  static var routes = <String, Widget>{
    '/': const SplashScreen(),
    '/home': const HomeScreen(),
    '/welcome': const WelcomeScreen(),
    '/login': const LoginScreen(),
  };

  static push(BuildContext context, target) {
    if (target.runtimeType == String) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => routes[target] ?? const RouteNotFound(),
        ),
      );
    } else if (target.runtimeType == Widget) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => target),
      );
    } else {
      HRoute.push(context, const RouteNotFound());
    }
  }

  static replaceWith(BuildContext context, target) {
    if (target.runtimeType == String) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => routes[target] ?? const RouteNotFound(),
        ),
      );
    } else if (target.runtimeType == Widget) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => target),
      );
    } else {
      HRoute.push(context, const RouteNotFound());
    }
  }

  static go(BuildContext context, target, [bool Function(Route)? predicate]) {
    if (target.runtimeType == String) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => routes[target] ?? const RouteNotFound(),
        ),
        predicate ?? (_) => false,
      );
    } else if (target.runtimeType == Widget) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => target),
        predicate ?? (_) => false,
      );
    } else {
      HRoute.push(context, const RouteNotFound());
    }
  }

  static pop(BuildContext context){
    Navigator.pop(context);
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
