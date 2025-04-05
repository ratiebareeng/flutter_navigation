import 'package:flutter/material.dart';
import 'package:flutter_navigation/flutter_navigation.dart';

void main() {
  runApp(const MyApp());
}

// Create a global NavigationService instance
final navigationService = NavigationService();

class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This page was opened with a $title'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Using the navigation service to go back
                navigationService.goBack();

                // Alternative: using Navigator directly
                // Navigator.of(context).pop();
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Navigation Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Method 1: Using the NavigationService directly
            ElevatedButton(
              onPressed: () {
                navigationService.slideRight(
                  const DetailPage(title: 'Slide Right Transition (Service)'),
                );
              },
              child: const Text('Slide Right (Using Service)'),
            ),
            const SizedBox(height: 16),

            // Method 2: Using static methods with navigatorKey
            ElevatedButton(
              onPressed: () {
                SlideLeftRoute.navigate(
                  navigationService.navigatorKey,
                  const DetailPage(title: 'Slide Left Transition (Static)'),
                );
              },
              child: const Text('Slide Left (Using Static Method)'),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                navigationService.fade(
                  const DetailPage(title: 'Fade Transition'),
                );
              },
              child: const Text('Fade Transition'),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                navigationService.scale(
                  const DetailPage(title: 'Scale Transition'),
                  alignment: Alignment.bottomCenter,
                );
              },
              child: const Text('Scale Transition'),
            ),
            const SizedBox(height: 16),

            // Advanced example - replacing a route
            ElevatedButton(
              onPressed: () {
                navigationService.replaceWithSlideRight(
                  const DetailPage(title: 'Replaced Page'),
                );
              },
              child: const Text('Replace Current Route'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Use the NavigationService's navigatorKey
      navigatorKey: navigationService.navigatorKey,
      home: const HomePage(),
    );
  }
}
