import 'package:book_app/utils/print_helper.dart';
import 'package:book_app/views/home/home_screen.dart';
import 'package:book_app/views/login_screen.dart';
import 'package:book_app/views/splash_screen.dart';
import 'package:book_app/views/welcome_screen.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

enum TransitionType { none, zoom, cupertino, fadeUpwards, openUpwards }

class Go {
  // disadvantage is you can't use predicate of pushAndRemoveUntil

  static to(Widget child, [TransitionType? type]) {
    PageRoute pageRoute = _getPageRoute(child, type);
    navigatorKey.currentState?.push(pageRoute) ??
        printError('Navigator state return null.');
  }

  static replace(Widget child, [TransitionType? type]) {
    PageRoute pageRoute = _getPageRoute(child, type);
    navigatorKey.currentState?.pushReplacement(pageRoute) ??
        printError('Navigator state return null.');
  }

  static reset(Widget child, [TransitionType? type]) {
    PageRoute pageRoute = _getPageRoute(child, type);
    navigatorKey.currentState?.pushAndRemoveUntil(pageRoute, (_) => false) ??
        printError('Navigator state return null.');
  }

  static back([result]) {
    var state = navigatorKey.currentState;
    if (state == null) return printWarning('Navigator state is null.');
    if (!state.canPop()) return printWarning('canPop is null');
    state.pop(result);
  }

  static backRepeat(int time) {
    var state = navigatorKey.currentState;
    if (state == null) return printWarning('Navigator state is null.');
    if (!state.canPop()) return printWarning('canPop is null');
    int count = 0;
    state.popUntil((route) => count++ >= time);
  }

}

PageRoute _getPageRoute(Widget route, TransitionType? type) {
  PageRoute? pageRoute;
  if (type == TransitionType.none) {
    pageRoute = PageRouteBuilder(pageBuilder: (_, __, ___) => route);
  } else if (type == TransitionType.zoom) {
    pageRoute = _CustomPageRouteBuilder(
      pageBuilder: (_, __, ___) => route,
      pageTransitionsBuilder: const ZoomPageTransitionsBuilder(),
    );
  } else if (type == TransitionType.cupertino) {
    pageRoute = _CustomPageRouteBuilder(
      pageBuilder: (_, __, ___) => route,
      pageTransitionsBuilder: const CupertinoPageTransitionsBuilder(),
    );
  } else if (type == TransitionType.fadeUpwards) {
    pageRoute = _CustomPageRouteBuilder(
      pageBuilder: (_, __, ___) => route,
      pageTransitionsBuilder: const FadeUpwardsPageTransitionsBuilder(),
    );
  } else if (type == TransitionType.openUpwards) {
    pageRoute = _CustomPageRouteBuilder(
      pageBuilder: (_, __, ___) => route,
      pageTransitionsBuilder: const OpenUpwardsPageTransitionsBuilder(),
    );
  }
  return pageRoute ?? MaterialPageRoute(builder: (_) => route);
}

class _CustomPageRouteBuilder<T> extends PageRouteBuilder<T> {
  final PageTransitionsBuilder pageTransitionsBuilder;

  _CustomPageRouteBuilder({
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
