import 'package:changpharma/screens/reminder_screen.dart';
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
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/auth': (context) => const AuthScreen(),
        '/reminder': (context) => const ReminderScreen(),
      },
    );
  }
}
