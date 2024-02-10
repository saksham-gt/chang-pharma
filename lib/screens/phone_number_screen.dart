import 'package:changpharma/notifiers/notifier.dart';
import 'package:changpharma/notifiers/states/get_otp_states.dart';
import 'package:flutter/material.dart';
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
          Navigator.pushNamed(context, '/otp', arguments: {'requestId': next.requestId});
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
              controller: phoneController,
              decoration: const InputDecoration(hintText: "Mobile Number"),
              keyboardType: TextInputType.phone,
            ),
            ElevatedButton(
              onPressed: () {
                if (phoneController.text.isEmpty ||
                    phoneController.text.trim().length != 10) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Enter a valid mobile number"),
                    ),
                  );
                } else {
                  ref
                      .read(getOtpNotifier.notifier)
                      .getOtp(phoneController.text.trim());
                }
              },
              child: ref.watch(getOtpNotifier
                      .select((value) => value is OtpGettingState))
                  ? const CircularProgressIndicator()
                  : const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
