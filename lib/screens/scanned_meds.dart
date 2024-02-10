import 'dart:developer';
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
  late final XFile capturedImage;
  List<Medicine> scannedMedicines = [];

  Future<void> extractMedicines() async {
    try {
      final imageBytes = await capturedImage.readAsBytes();
      final multipartFile = MultipartFile.fromBytes(imageBytes);
      final scannedMedicinesResponse = await Dio(BaseOptions(
        receiveTimeout: const Duration(seconds: 60),
      )).post(
        'https://a20fe694031d-2837090015980470887.ngrok-free.app',
        data: multipartFile.finalize(),
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/octet-stream',
            HttpHeaders.contentLengthHeader: imageBytes.lengthInBytes,
          },
        ),
      );
      scannedMedicines = scannedMedicinesResponse.data
          .map<Medicine>((scannedMedicineResponse) =>
              Medicine.fromMap(scannedMedicineResponse))
          .toList();
      setState(() {});
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    capturedImage = ModalRoute.of(context)!.settings.arguments as XFile;
    extractMedicines();
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
            ...scannedMedicines
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
                                    Text(scannedMedicine.duration ?? '-'),
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
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            onPressed: () => Navigator.pushNamed(
                                context, '/formForMed',
                                arguments: scannedMedicine),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
