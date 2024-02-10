import 'package:changpharma/notifiers/notifier.dart';
import 'package:changpharma/notifiers/states/get_otp_states.dart';
import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhoneNumberLoginScreen extends ConsumerWidget {
  PhoneNumberLoginScreen({super.key});
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      getOtpNotifier,
      (previous, next) {
        if (next is OtpGetSuccessState) {
          Navigator.pushNamed(context, '/otp', arguments: {'requestId': next.requestId, 'phone': phoneController.text.trim(),
          });
        }
      },
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                'We will need a few more details before we start managing your medicines.',
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
                'Enter your mobile number',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: phoneController,
                cursorColor: SystemColors.pharmacyGreen,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: "Mobile Number",
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
                  if (value != null) {
                    if (value.length < 10) {
                      return 'Mobile number should be 10 digits long.';
                    }
                  }
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
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: () => onLogin(ref),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: SystemColors.mintCream,
                    fontFamily: CPFont.fontFamily,
                    fontSize: 24.0,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  void onLogin(WidgetRef ref) {
    ref.read(getOtpNotifier.notifier).getOtp(phoneController.text.trim());
  }
}
