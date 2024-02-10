import 'package:changpharma/extensions/string_extensions.dart';
import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupInfoScreen extends StatelessWidget {
  SignupInfoScreen({super.key});

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                'Almost done with your setup...',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: nameController,
                cursorColor: SystemColors.pharmacyGreen,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: "Name",
                  errorStyle: TextStyle(
                    fontFamily: CPFont.fontFamily,
                    fontSize: 14,
                    color: SystemColors.vanilla,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                    borderSide: BorderSide(color: SystemColors.pharmacyGreen),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                    borderSide: BorderSide(color: SystemColors.pharmacyGreen),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                    borderSide: BorderSide(color: SystemColors.vanilla),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                    borderSide: BorderSide(color: SystemColors.pharmacyGreen),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                    borderSide: BorderSide(color: SystemColors.vanilla),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Name required';
                  }
                  if (value.trim().isEmpty) {
                    return 'Name required';
                  }

                  if (!value.isValidAlphanumeric()) {
                    return 'Invalid input';
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: const TextStyle(
                  fontFamily: CPFont.fontFamily,
                  fontSize: 24,
                  height: 1.3,
                  color: Colors.white,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 20),
              const Text(
                'Age',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: ageController,
                cursorColor: SystemColors.pharmacyGreen,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: "Age",
                  errorStyle: TextStyle(
                    fontFamily: CPFont.fontFamily,
                    fontSize: 14,
                    color: SystemColors.vanilla,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                    borderSide: BorderSide(color: SystemColors.pharmacyGreen),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                    borderSide: BorderSide(color: SystemColors.pharmacyGreen),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                    borderSide: BorderSide(color: SystemColors.vanilla),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                    borderSide: BorderSide(color: SystemColors.pharmacyGreen),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                    borderSide: BorderSide(color: SystemColors.vanilla),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Age required';
                  }
                  if (value.trim().isEmpty) {
                    return 'Age required';
                  }

                  if (!value.isValidNumeric()) {
                    return 'Invalid input';
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: const TextStyle(
                  fontFamily: CPFont.fontFamily,
                  fontSize: 24,
                  height: 1.3,
                  color: Colors.white,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue',
                      style: TextStyle(
                        color: SystemColors.mintCream,
                        fontFamily: CPFont.fontFamily,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
