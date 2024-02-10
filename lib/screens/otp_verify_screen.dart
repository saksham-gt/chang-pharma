import 'package:changpharma/notifiers/notifier.dart';
import 'package:changpharma/notifiers/states/get_otp_states.dart';
import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpVerifyScreen extends ConsumerWidget {
  OtpVerifyScreen({super.key});

  void _getSnackBar(BuildContext context, Widget content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content,
      ),
    );
  }

  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      getOtpNotifier,
      (previous, next) {
        if (next is OtpVerifySuccessState) {
          // print(
          //     "isLogin bool: ${(args as Map<String, bool>)['isLogin'] as bool}");
          // if (args != null) {
          //   if ((args as Map<String, bool>)['isLogin'] as bool) {
          Navigator.pushNamed(context, '/home');
          //   } else {
          //     Navigator.pushNamed(context, '/signup');
          //   }
          // }
        } else if (next is OtpVerifyErrorState) {
          _getSnackBar(
            context,
            const Text("Error: Incorrect OTP"),
          );
        }
      },
    );
    final String requestId = 
    (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)["requestId"] as String;
    final String phone  =  (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)["phone"] as String;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Text(
              'Verify OTP',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text(
              'Enter the OTP sent to your mobile number',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontFamily: 'Inter',
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 16),
            OtpTextField(
              numberOfFields: 4,
              fillColor: Colors.white,
              borderColor: SystemColors.pharmacyGreen,
              cursorColor: Colors.white,
              enabledBorderColor: SystemColors.pharmacyGreen,
              focusedBorderColor: SystemColors.vanilla,
              disabledBorderColor: SystemColors.vanilla,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                ref
                    .read(getOtpNotifier.notifier)
                    .verifyOtp(phone, requestId, verificationCode);
              },
              textStyle: const TextStyle(
                fontFamily: CPFont.fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            ref.watch(getOtpNotifier
                    .select((value) => value is OtpVerifyingState))
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Verifying your OTP',
                          style: TextStyle(
                            fontFamily: CPFont.fontFamily,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}