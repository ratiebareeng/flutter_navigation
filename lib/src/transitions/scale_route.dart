import 'package:flutter/material.dart';

/// A page route that scales in the new page.
class ScaleRoute extends PageRouteBuilder {
  /// The widget to be navigated to.
  final Widget page;

  /// Duration of the transition animation.
  final Duration duration;

  /// Alignment for the scale animation.
  final Alignment alignment;

  /// Creates a [ScaleRoute].
  ///
  /// The [page] parameter is required and specifies the widget to navigate to.
  /// The [duration] parameter specifies the duration of the transition animation.
  /// The [alignment] parameter specifies the alignment for the scale animation.
  ScaleRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
    this.alignment = Alignment.center,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return ScaleTransition(
             scale: animation,
             alignment: alignment,
             child: child,
           );
         },
         transitionDuration: duration,
       );

  /// Navigates to the specified page using a scale transition.
  ///
  /// [navigatorKey] is the key associated with the Navigator.
  /// [page] is the widget to navigate to.
  /// [duration] is the duration of the transition animation.
  /// [alignment] is the alignment for the scale animation.
  static Future<T?> navigate<T>(
    GlobalKey<NavigatorState> navigatorKey,
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    Alignment alignment = Alignment.center,
  }) {
    return navigatorKey.currentState!.push<T>(
      ScaleRoute(page: page, duration: duration, alignment: alignment)
          as Route<T>,
    );
  }

  /// Replaces the current route with the specified page using a scale transition.
  ///
  /// [navigatorKey] is the key associated with the Navigator.
  /// [page] is the widget to navigate to.
  /// [duration] is the duration of the transition animation.
  /// [alignment] is the alignment for the scale animation.
  static Future<T?> replace<T>(
    GlobalKey<NavigatorState> navigatorKey,
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    Alignment alignment = Alignment.center,
  }) {
    return navigatorKey.currentState!.pushReplacement(
      ScaleRoute(page: page, duration: duration, alignment: alignment)
          as Route<T>,
    );
  }
}
