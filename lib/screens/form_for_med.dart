import 'package:changpharma/models/medicine.dart';
import 'package:flutter/material.dart';

class FormForMedScreen extends StatefulWidget {
  const FormForMedScreen({super.key});

  @override
  State<FormForMedScreen> createState() => _FormForMedScreenState();
}

class _FormForMedScreenState extends State<FormForMedScreen> {
  late final Medicine medicine;
  final _drugNameController = TextEditingController();
  final _durationController = TextEditingController();
  final _frequencyController = TextEditingController();
  final _dosageController = TextEditingController();
  final _formController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    medicine = ModalRoute.of(context)!.settings.arguments as Medicine;
    _drugNameController.text = medicine.drug ?? '';
    _durationController.text = medicine.duration ?? '';
    _frequencyController.text = medicine.frequency ?? '';
    _dosageController.text = medicine.dosage ?? '';
    _formController.text = medicine.form ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text(
              'Add Medicine',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Drug Name',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _drugNameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Drug Name',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Duration',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _durationController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Duration',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Frequency',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _frequencyController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Frequency',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dosage',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _dosageController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Frequency',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Form',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _formController,
                  onChanged: (value) => {
                    // medicine.form = value;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Frequency',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: () {
                  final saveMedicine = medicine.copyWith(
                    drug: _drugNameController.text,
                    duration: _durationController.text,
                    frequency: _frequencyController.text,
                    dosage: _dosageController.text,
                    form: _formController.text,
                  );
                  print(saveMedicine);
                },
                child: const Text(
                  'Confirm and save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
