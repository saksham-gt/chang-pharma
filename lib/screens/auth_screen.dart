import 'package:changpharma/notifiers/notifier.dart';
import 'package:changpharma/notifiers/states/get_otp_states.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  AuthScreen({super.key});

  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ChangPharma",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: CPTheme.bgColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("+91"),
                  PhoneNumberPicker(controller: _phoneNumberController),
                ],
              ),
              GetOtpButton(controller: _phoneNumberController),
            ],
          ),
        ),
      ),
    );
  }
}

class GetOtpButton extends ConsumerWidget {
  final TextEditingController controller;
  const GetOtpButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpState = ref.watch(getOtpNotifier);

    ref.listen(
      getOtpNotifier,
      (previous, next) {
        if (next is OtpGetSuccessState) {
          Navigator.pushNamed(context, '/home');
        }
      },
    );
    return ElevatedButton(
      onPressed: () {
        if (controller.text.isEmpty || controller.text.length < 10) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please enter a valid phone number"),
            ),
          );
          return;
        } else {
          ref.read(getOtpNotifier.notifier).getOtp(controller.text.trim());
        }
      },
      child:
          ref.watch(getOtpNotifier.select((value) => value is OtpGettingState))
              ? const CircularProgressIndicator()
              : const Text("Login"),
    );
  }
}

class PhoneNumberPicker extends StatelessWidget {
  final TextEditingController controller;
  const PhoneNumberPicker({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: "Mobile Number",
        ),
        keyboardType: TextInputType.phone,
      ),
    );
  }
}
