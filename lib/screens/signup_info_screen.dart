import 'package:flutter/material.dart';

class SignupInfoScreen extends StatelessWidget {
  SignupInfoScreen({super.key});

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
          ),
          TextFormField(
            controller: ageController,
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isNotEmpty &&
                    int.tryParse(ageController.text.trim()) != null) {
                  Navigator.pushNamed(context, "/home");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please fill details correctly"),
                    ),
                  );
                }
              },
              child: const Text("Sign up"))
        ],
      ),
    );
  }
}
