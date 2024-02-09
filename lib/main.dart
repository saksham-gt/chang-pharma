import 'package:changpharma/screens/reminder_screen.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:flutter/material.dart';

import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chang Pharma',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        cardTheme: CardTheme(
          elevation: 2,
          shadowColor: CPTheme.bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
            color: CPTheme.textColor,
            // fontFamily: CPTheme.fontFamily,
          ),
          displayMedium: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.w400,
            color: CPTheme.textColor,
          ),
          displaySmall: TextStyle(
            fontSize: 14.0,
            color: CPTheme.textColor,
            // fontFamily: CPTheme.fontFamily,
          ),
        ),
      ),
      routes: {
        '/': (context) => AuthScreen(),
        '/auth': (context) => AuthScreen(),
        '/reminder': (context) => const ReminderScreen(),
      },
    );
  }
}
