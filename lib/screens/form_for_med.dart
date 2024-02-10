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
  final time = <DateTime?>[];

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
    time.add(null);
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
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Time of taking medicines',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: CPFont.fontFamily,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  time.add(null);
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        ...time
                            .map(
                              (element) => GestureDetector(
                                onTap: () async {
                                  final selectedtime = await showTimePicker(
                                    context: context,
                                    initialTime:
                                        const TimeOfDay(hour: 0, minute: 0),
                                  );
                                  if (selectedtime != null) {
                                    setState(() {
                                      final today = DateTime.now();
                                      final index = time.indexOf(element);
                                      time[index] = (DateTime(
                                        today.year,
                                        today.month,
                                        today.day,
                                        selectedtime.hour,
                                        selectedtime.minute,
                                      ));
                                    });
                                  }
                                },
                                child: Container(
                                  height: 62,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.6)),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      element != null
                                          ? Text(
                                              MaterialLocalizations.of(context)
                                                  .formatTimeOfDay(
                                                TimeOfDay(
                                                    hour: element.hour,
                                                    minute: element.minute),
                                              ),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: CPFont.fontFamily,
                                              ),
                                            )
                                          : Expanded(
                                              child: Text(
                                                'Select time of medication',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: CPFont.fontFamily,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                       Icon(
                                        Icons.access_time,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 44,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          time.removeWhere((element) => element == null);
                          final saveMedicine = medicine.copyWith(
                            drug: _drugNameController.text,
                            duration: int.tryParse(_durationController.text),
                            frequency: _frequencyController.text,
                            dosage: _dosageController.text,
                            form: _formController.text,
                            time: time.map((e) => e!).toList(),
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
