import 'dart:io';

import 'package:changpharma/models/medicine.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScannedMedsScreen extends StatefulWidget {
  const ScannedMedsScreen({super.key});

  @override
  State<ScannedMedsScreen> createState() => _ScannedMedsScreenState();
}

class _ScannedMedsScreenState extends State<ScannedMedsScreen> {
  List<Medicine> addedMedicines = [];
  var isLoading = true;

  Future<void> getMedicines() async {
    // TODO:
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            const Text(
              'Scanned Medicines',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(),
            ...addedMedicines
                .map(
                  (scannedMedicine) => Container(
                    padding: const EdgeInsets.all(24),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.grey[50],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          scannedMedicine.drug ?? '',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.access_time),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Frequency',
                                      style: TextStyle(
                                        fontSize: 20,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(scannedMedicine.frequency ?? '-'),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.hourglass_top_outlined),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Duration',
                                      style: TextStyle(
                                        fontSize: 20,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                        ('${scannedMedicine.duration ?? '-'} days')),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.medication_liquid_sharp),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Dosage',
                                      style: TextStyle(
                                        fontSize: 20,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(scannedMedicine.dosage ?? '-'),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.vaccines),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Form     ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(scannedMedicine.form ?? '-'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
