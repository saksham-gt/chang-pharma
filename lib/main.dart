import 'package:changpharma/screens/reminder_screen.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:changpharma/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDep();
  runApp(const ProviderScope(child: MyApp()));
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
            fontSize: 48.0,
            fontWeight: FontWeight.w500,
            color: CPTheme.textColor,
            fontFamily: CPFont.fontFamily,
          ),
          displayMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.normal,
            color: CPTheme.textColor,
            fontFamily: CPFont.fontFamily,
          ),
          displaySmall: TextStyle(
            fontSize: 14.0,
            color: CPTheme.textColor,
            fontFamily: CPFont.fontFamily,
          ),
        ),
      ),
      routes: {
        '/': (context) => AuthScreen(),
        '/home': (context) => const HomeScreen(),
        '/reminder': (context) => const ReminderScreen(),
      },
    );
  }
}
