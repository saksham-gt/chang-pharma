import 'package:changpharma/notifiers/notifier.dart';
import 'package:changpharma/notifiers/states/get_otp_states.dart';
import 'package:flutter/material.dart';
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
          final args = ModalRoute.of(context)!.settings.arguments;
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: otpController,
              decoration: const InputDecoration(hintText: "Enter OTP"),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                if (otpController.text.isEmpty ||
                    otpController.text.trim().length != 6) {
                  _getSnackBar(
                    context,
                    const Text("Please enter valid OTP"),
                  );
                } else {
                  ref
                      .read(getOtpNotifier.notifier)
                      .verifyOtp(otpController.text.trim());
                }
              },
              child: ref.watch(getOtpNotifier
                      .select((value) => value is OtpVerifyingState))
                  ? const CircularProgressIndicator()
                  : const Text("Verify"),
            )
          ],
        ),
      ),
    );
  }
}
