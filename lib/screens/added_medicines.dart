import 'package:changpharma/models/medicine.dart';
import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:flutter/material.dart';

class AddedMedsScreen extends StatefulWidget {
  const AddedMedsScreen({super.key});

  @override
  State<AddedMedsScreen> createState() => _AddedMedsScreenState();
}

class _AddedMedsScreenState extends State<AddedMedsScreen> {
  List<Medicine> addedMedicines = [];
  var isLoading = true;

  Future<void> getMedicines() async {
    // TODO:
    addedMedicines = [
      Medicine(
          drug: 'Paracetamol',
          time: [
            DateTime(2024, 2, 11, 5, 30),
            DateTime(2024, 2, 11, 10, 30),
          ],
          duration: 4,
          dosage: '3ml',
          strength: '500mg',
          form: 'Tablet'),
      Medicine(
          drug: 'Dolo 650mg',
          time: [
            DateTime(2024, 2, 11, 5, 30),
          ],
          duration: 4,
          dosage: '3ml',
          strength: '500mg',
          form: 'Liquid'),
      Medicine(
          drug: 'Cisapride',
          time: [
            DateTime(2024, 2, 11, 5, 30),
          ],
          duration: 4,
          dosage: '3ml',
          strength: '500mg',
          form: 'Tablet'),
    ];
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: SystemColors.pharmacyGreen,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => Navigator.pushNamed(
          context,
          '/formForMed',
          arguments: Medicine(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text(
              'Added Medicines',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                fontFamily: CPFont.fontFamily,
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
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: SystemColors.bannerSecondaryColor,
                              ),
                              child: InkWell(
                                onTap: () {
                                  addedMedicines.remove(scannedMedicine);
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.delete_outlined,
                                ),
                              ),
                            ),
                          ],
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
                                      'Timings',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: CPFont.fontFamily,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      (scannedMedicine.time ?? [])
                                          .map(
                                            (element) =>
                                                MaterialLocalizations.of(
                                                        context)
                                                    .formatTimeOfDay(
                                              TimeOfDay(
                                                  hour: element.hour,
                                                  minute: element.minute),
                                            ),
                                          )
                                          .toList()
                                          .join(', '),
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

                                        // fontWeight: FontWeight.w600,
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
                                        // fontWeight: FontWeight.w600,
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
