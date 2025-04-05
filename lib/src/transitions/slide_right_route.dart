import 'package:flutter/widgets.dart';

/// A page route that slides in from the left and slides out to the right.
/// This is a custom implementation of the [PageRoute] class that provides a
/// transition effect for navigating between pages in a Flutter application.
/// It uses a [SlideTransition] to animate the position of the new page as it
/// enters and exits the screen.
class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  final Duration duration;

  /// Creates a [SlideRightRoute].
  ///
  /// The [page] parameter is required and specifies the widget to navigate to.
  /// The [duration] parameter specifies the duration of the transition animation.
  SlideRightRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           const begin = Offset(-1.0, 0.0);
           const end = Offset.zero;
           const curve = Curves.ease;

           var tween = Tween(
             begin: begin,
             end: end,
           ).chain(CurveTween(curve: curve));
           var offsetAnimation = animation.drive(tween);

           return SlideTransition(position: offsetAnimation, child: child);
         },
         transitionDuration: duration,
       );

  /// Navigates to the specified page using a slide-right transition.
  ///
  /// [navigatorKey] is the key associated with the Navigator.
  /// [page] is the widget to navigate to.
  /// [duration] is the duration of the transition animation.
  static Future<void> navigate(
    GlobalKey<NavigatorState> navigatorKey,
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return navigatorKey.currentState!.push(
      SlideRightRoute(page: page, duration: duration),
    );
  }

  /// Replaces the current route with the specified page using a slide-right transition.
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
      SlideRightRoute(page: page, duration: duration) as Route<T>,
    );
  }
}
