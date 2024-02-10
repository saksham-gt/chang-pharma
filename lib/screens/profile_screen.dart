import 'package:changpharma/extensions/string_extensions.dart';
import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:changpharma/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String get userName => 'Test User';
  String get userAge => '22';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: CPFont.fontFamily,
            fontSize: 28.0,
            color: SystemColors.mintCream,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: userName,
                readOnly: true,
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
                  fontSize: 20,
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
                  fontSize: 16.0,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: userAge,
                readOnly: true,
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
                  fontSize: 20,
                  height: 1.3,
                  color: Colors.white,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                keyboardType: TextInputType.name,
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: SystemColors.vanilla),
                ),
                onPressed: () => onLogout(),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: SystemColors.vanilla,
                        fontFamily: CPFont.fontFamily,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.logout_outlined,
                      color: SystemColors.vanilla,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void onLogout() {
  }
}
