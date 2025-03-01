import 'package:flutter/material.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/home_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moodie',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const OnboardingScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}