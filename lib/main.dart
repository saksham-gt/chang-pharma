import 'package:changpharma/models/default_meal_time.dart';
import 'package:changpharma/screens/added_medicines.dart';
import 'package:changpharma/screens/form_for_med.dart';
import 'package:changpharma/screens/otp_verify_screen.dart';
import 'package:changpharma/screens/scanned_meds.dart';
import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:changpharma/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/profile_screen.dart';
import 'screens/user_preferences_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/phone_number_screen.dart';
import 'screens/home_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/signup_info_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDep();
    if(sharedPrefs.get("phone")!=null){
      
    final res = await apiClient.getUserByNumber(sharedPrefs.get("phone") as String);
        if(res.statusCode==201){
          final user = res.data as Map<String, dynamic>; 
          selfUser.uid = user['userId'] as String;
          selfUser.mobile = user["mobileNumber"] as String;
          selfUser.defaultMealTime = DefaultMealTime(breakfast: DateTime.fromMillisecondsSinceEpoch(user["defaultTimers"]["breakfastTime"] as int),lunch: DateTime.fromMillisecondsSinceEpoch(user["defaultTimers"]["lunchTime"] as int), dinner: DateTime.fromMillisecondsSinceEpoch(user["defaultTimers"]["dinnerTime"] as int));
          selfUser.enableReminder = user["enableReminder"] as bool;
        }
    }
    
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chang Pharma',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF08090A),
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
        buttonTheme: const ButtonThemeData(
          buttonColor: SystemColors.fernGreen,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: SystemColors.pharmacyGreen,
          ),
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        '/': (context) => sharedPrefs.get("phone")!=null? const HomeScreen(): const LandingScreen(),
        '/login': (context) => PhoneNumberLoginScreen(),
        '/signup': (context) => SignupInfoScreen(),
        '/otp': (context) => OtpVerifyScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/manage-reminders': (context) => const UserPreferencesScreen(),
        '/scannedMeds': (context) => const ScannedMedsScreen(),
        '/formForMed': (context) => const FormForMedScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/addedMeds': (context) => const AddedMedsScreen(),
      },
    );
  }
}
