import 'package:flutter/material.dart';

/// A page route that fades in the new page.
class FadeRoute extends PageRouteBuilder {
  /// The widget to be navigated to.
  final Widget page;

  /// Duration of the transition animation.
  final Duration duration;

  /// Creates a [FadeRoute].
  ///
  /// The [page] parameter is required and specifies the widget to navigate to.
  /// The [duration] parameter specifies the duration of the transition animation.
  FadeRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return FadeTransition(opacity: animation, child: child);
         },
         transitionDuration: duration,
       );

  /// Navigates to the specified page using a fade transition.
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
      FadeRoute(page: page, duration: duration) as Route<T>,
    );
  }

  /// Replaces the current route with the specified page using a fade transition.
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
      FadeRoute(page: page, duration: duration) as Route<T>,
    );
  }
}
