import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Go-to',
                style: TextStyle(
                  fontSize: 72.0,
                  fontWeight: FontWeight.bold,
                  color: SystemColors.mintCream,
                  fontFamily: 'Inter',
                ),
              ),
              const Text(
                'Companion',
                style: TextStyle(
                  fontSize: 64.0,
                  fontWeight: FontWeight.bold,
                  color: SystemColors.mintCream,
                  // decoration: TextDecoration.underline,
                  // decorationColor: SystemColors.mintCream,
                  fontFamily: 'Inter',
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'for all your ',
                  style: TextStyle(
                    fontSize: 46.0,
                    fontFamily: 'Inter',
                  ),
                  children: [
                    TextSpan(
                      text: 'meds',
                      style: TextStyle(
                        fontSize: 46.0,
                        height: 1.3,
                        decoration: TextDecoration.underline,
                        decorationColor: SystemColors.mintCream,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: () => onLogin(context),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: SystemColors.mintCream,
                    fontFamily: CPFont.fontFamily,
                    fontSize: 24.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: onSignup,
                child: const Text(
                  'Signup',
                  style: TextStyle(
                    color: SystemColors.mintCream,
                    fontFamily: CPFont.fontFamily,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLogin(BuildContext context) async {
    Navigator.pushNamed(context, '/home');
  }

  void onSignup() async {}
}
