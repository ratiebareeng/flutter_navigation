import 'package:flutter/material.dart';
import 'package:flutter_navigation/flutter_navigation.dart';

/// A service that handles navigation without requiring a BuildContext.
class NavigationService {
  /// The singleton instance of the navigation service.
  static final NavigationService _instance = NavigationService._internal();

  /// Global key for the navigator.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Factory constructor to return the singleton instance.
  factory NavigationService() => _instance;

  /// Private constructor used by the singleton factory.
  NavigationService._internal();

  /// Navigates to the specified page with a fade transition.
  ///
  /// [page] is the widget to navigate to.
  /// [duration] is the duration of the transition animation.
  Future<T?> fade<T>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return FadeRoute.navigate<T>(navigatorKey, page, duration: duration);
  }

  /// Pops the current route off the navigator.
  ///
  /// [result] is the result to be returned to the previous route.
  void goBack<T>([T? result]) {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop(result);
    }
  }

  /// Navigates to the specified route.
  ///
  /// [route] is the route to navigate to.
  Future<T?> navigate<T>(Route<T> route) {
    return navigatorKey.currentState!.push(route);
  }

  /// Pops all routes until the predicate returns true.
  ///
  /// [predicate] is a function that returns true when the desired route is found.
  void popUntil(RoutePredicate predicate) {
    navigatorKey.currentState!.popUntil(predicate);
  }

  /// Pops all routes and pushes the given route.
  ///
  /// [route] is the route to navigate to.
  Future<T?> pushAndRemoveUntil<T>(Route<T> route) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      route,
      (route) => false,
    );
  }

  /// Pops all routes and pushes the given page with a slide right transition.
  ///
  /// [page] is the widget to navigate to.
  /// [duration] is the duration of the transition animation.
  Future<T?> pushAndRemoveUntilWithSlideRight<T>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      SlideRightRoute(page: page, duration: duration) as Route<T>,
      (route) => false,
    );
  }

  /// Replaces the current route with the specified route.
  ///
  /// [route] is the route to navigate to.
  Future<T?> replace<T>(Route<T> route) {
    return navigatorKey.currentState!.pushReplacement(route);
  }

  /// Replaces the current route with the specified page using a slide right transition.
  ///
  /// [page] is the widget to navigate to.
  /// [duration] is the duration of the transition animation.
  Future<T?> replaceWithSlideRight<T>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return SlideRightRoute.replace<T>(navigatorKey, page, duration: duration);
  }

  /// Navigates to the specified page with a scale transition.
  ///
  /// [page] is the widget to navigate to.
  /// [duration] is the duration of the transition animation.
  /// [alignment] is the alignment for the scale animation.
  Future<T?> scale<T>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    Alignment alignment = Alignment.center,
  }) {
    return ScaleRoute.navigate<T>(
      navigatorKey,
      page,
      duration: duration,
      alignment: alignment,
    );
  }

  /// Navigates to the specified page with a slide left transition.
  ///
  /// [page] is the widget to navigate to.
  /// [duration] is the duration of the transition animation.
  Future<T?> slideLeft<T>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return SlideLeftRoute.navigate(navigatorKey, page, duration: duration);
  }

  /// Navigates to the specified page with a slide right transition.
  ///
  /// [page] is the widget to navigate to.
  /// [duration] is the duration of the transition animation.
  Future<T?> slideRight<T>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return SlideRightRoute.navigate(navigatorKey, page, duration: duration);
  }
}
