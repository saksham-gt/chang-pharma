import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("+91"),
                  PhoneNumberPicker(controller: _phoneNumberController),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_phoneNumberController.text.isEmpty ||
                      _phoneNumberController.text.length < 10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter a valid phone number"),
                      ),
                    );
                    return;
                  } else {
                    Navigator.pushNamed(context, '/home');
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
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
