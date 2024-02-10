import 'package:changpharma/models/medicine.dart';
import 'package:changpharma/utils/theme.dart';
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
  final _strengthController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    medicine = ModalRoute.of(context)!.settings.arguments as Medicine;
    _drugNameController.text = medicine.drug ?? '';
    _durationController.text = medicine.duration?.toString() ?? '';
    _frequencyController.text = medicine.frequency ?? '';
    _dosageController.text = medicine.dosage ?? '';
    _formController.text = medicine.form ?? '';
    _strengthController.text = medicine.strength ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    )),
                const Text(
                  'Add Medicine',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    fontFamily: CPFont.fontFamily,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Form(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Drug Name',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: CPFont.fontFamily,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _drugNameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Drug Name',
                            hintStyle: TextStyle(
                              fontFamily: CPFont.fontFamily,
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16,
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
                          'Duration',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: CPFont.fontFamily,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _durationController,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Duration',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: CPFont.fontFamily,
                              fontSize: 16,
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
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: CPFont.fontFamily,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _frequencyController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Frequency',
                            hintStyle: TextStyle(
                              fontFamily: CPFont.fontFamily,
                              fontSize: 16,
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
                          'Dosage',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: CPFont.fontFamily,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _dosageController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Dosage',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: CPFont.fontFamily,
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
                          'Form',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _formController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Form',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: CPFont.fontFamily,
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
                          'Strength',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: CPFont.fontFamily,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _strengthController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Strength',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: CPFont.fontFamily,
                            ),
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
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          final saveMedicine = medicine.copyWith(
                            drug: _drugNameController.text,
                            duration: int.tryParse(_durationController.text),
                            frequency: _frequencyController.text,
                            dosage: _dosageController.text,
                            form: _formController.text,
                            strength: _strengthController.text,
                          );
                          print(saveMedicine);
                          // Navigator.pop(context, true);
                        },
                        child: const Text(
                          'Confirm and save',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: CPFont.fontFamily,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
