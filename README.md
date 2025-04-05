# Flutter Navigation

A Flutter package that provides custom page transitions and navigation utilities without requiring BuildContext.

## Features

- Context-free navigation using NavigatorKey
- Simple and customizable page transitions
- Static helper methods for common navigation patterns
- Navigation service with built-in transition methods
- Support for multiple transition types:
  - Slide (left, right, up, down)
  - Fade
  - Scale
  - And more...

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_navigation: ^0.0.1
```

## Usage

### Setup

First, initialize the NavigationService and set it up with your MaterialApp:

```dart
// Create a global instance of NavigationService
final navigationService = NavigationService();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigationService.navigatorKey,
      home: HomePage(),
    );
  }
}
```

### Using the Navigation Service

The simplest way to navigate is by using the NavigationService:

```dart
// Navigate to a new page with a slide right transition
navigationService.slideRight(
  YourPage(),
);

// Navigate with a fade transition
navigationService.fade(
  YourPage(),
);

// Navigate with a scale transition
navigationService.scale(
  YourPage(),
  alignment: Alignment.bottomCenter,
);

// Replace the current page with a new one
navigationService.replaceWithSlideRight(
  YourPage(),
);

// Go back
navigationService.goBack();
```

### Using Static Methods with NavigatorKey

You can also use the static methods directly with the NavigatorKey:

```dart
// Navigate to a new page with a slide right transition
SlideRightRoute.navigate(
  navigationService.navigatorKey,
  YourPage(),
);

// Replace the current page
SlideLeftRoute.replace(
  navigationService.navigatorKey,
  YourPage(),
);
```

### Advanced Navigation

```dart
// Push and remove all previous routes
navigationService.pushAndRemoveUntilWithSlideRight(
  YourPage(),
);

// Pop until a specific route
navigationService.popUntil((route) => route.isFirst);
```

## Customization

You can customize transition durations:

```dart
navigationService.slideRight(
  YourPage(),
  duration: Duration(milliseconds: 500), // Default is 300ms
);
```

## Available Transitions

1. **SlideRightRoute** - Slides in from the left
2. **SlideLeftRoute** - Slides in from the right 
3. **FadeRoute** - Fades in the new page
4. **ScaleRoute** - Scales in the new page

## Examples

Check the [example](./example/lib/main.dart) folder for a complete demo app.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
