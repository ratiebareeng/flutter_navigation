import 'package:flutter/material.dart';

/// A page route that slides in from the right to left.
class SlideLeftRoute extends PageRouteBuilder {
  /// The widget to be navigated to.
  final Widget page;

  /// Duration of the transition animation.
  final Duration duration;

  /// Creates a [SlideLeftRoute].
  ///
  /// The [page] parameter is required and specifies the widget to navigate to.
  /// The [duration] parameter specifies the duration of the transition animation.
  SlideLeftRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           const begin = Offset(1.0, 0.0);
           const end = Offset.zero;
           var curve = Curves.ease;
           var curveTween = CurveTween(curve: curve);

           final tween = Tween(begin: begin, end: end).chain(curveTween);
           final offsetAnimation = animation.drive(tween);

           return SlideTransition(position: offsetAnimation, child: child);
         },
         transitionDuration: duration,
       );

  /// Navigates to the specified page using a slide-left transition.
  ///
  /// [navigatorKey] is the key associated with the Navigator.
  /// [page] is the widget to navigate to.
  /// [duration] is the duration of the transition animation.
  static Future<T?> navigate<T>(
    GlobalKey<NavigatorState> navigatorKey,
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return navigatorKey.currentState!.push<T>(
      SlideLeftRoute(page: page, duration: duration) as Route<T>,
    );
  }

  /// Replaces the current route with the specified page using a slide-left transition.
  ///
  /// [navigatorKey] is the key associated with the Navigator.
  /// [page] is the widget to navigate to.
  /// [duration] is the duration of the transition animation.
  static Future<T?> replace<T>(
    GlobalKey<NavigatorState> navigatorKey,
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return navigatorKey.currentState!.pushReplacement(
      SlideLeftRoute(page: page, duration: duration) as Route<T>,
    );
  }
}
