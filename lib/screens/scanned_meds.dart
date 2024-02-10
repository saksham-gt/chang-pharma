import 'dart:io';

import 'package:changpharma/models/medicine.dart';
import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
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
  var isLoading = true;

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
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
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
                  'Scanned Medicines',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: CPFont.fontFamily,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              scannedMedicine.drug ?? '',
                              style: const TextStyle(
                                fontSize: 24,
                                fontFamily: CPFont.fontFamily,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: SystemColors.bannerSecondaryColor,
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      final isMedicineSaved =
                                          await Navigator.pushNamed(
                                              context, '/formForMed',
                                              arguments: scannedMedicine);
                                      if (isMedicineSaved == true) {
                                        scannedMedicines
                                            .remove(scannedMedicine);
                                        setState(() {});
                                      }
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.edit),
                                        SizedBox(width: 10),
                                        Text(
                                          'Edit',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: CPFont.fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: SystemColors.bannerSecondaryColor,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      scannedMedicines.remove(scannedMedicine);
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.delete_outlined,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                                        fontFamily: CPFont.fontFamily,
                                      ),
                                    ),
                                    Text(
                                      scannedMedicine.frequency ?? '-',
                                      style: const TextStyle(
                                        fontFamily: CPFont.fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
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
                                        fontFamily: CPFont.fontFamily,
                                      ),
                                    ),
                                    Text(
                                      ('${scannedMedicine.duration ?? '-'} days'),
                                      style: const TextStyle(
                                        fontFamily: CPFont.fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                                        fontFamily: CPFont.fontFamily,
                                      ),
                                    ),
                                    Text(
                                      scannedMedicine.dosage ?? '-',
                                      style: const TextStyle(
                                        fontFamily: CPFont.fontFamily,
                                      ),
                                    ),
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
                                        fontFamily: CPFont.fontFamily,
                                      ),
                                    ),
                                    Text(
                                      scannedMedicine.form ?? '-',
                                      style: const TextStyle(
                                        fontFamily: CPFont.fontFamily,
                                      ),
                                    ),
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
