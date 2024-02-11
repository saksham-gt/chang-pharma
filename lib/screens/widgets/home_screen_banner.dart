import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:changpharma/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/constants.dart';

class HomeScreenBanner extends StatefulWidget {
  const HomeScreenBanner({super.key});

  @override
  State<HomeScreenBanner> createState() => _HomeScreenBannerState();
}

class _HomeScreenBannerState extends State<HomeScreenBanner> {
  late String? status;

  @override
  void initState() {
    super.initState();
    status = sharedPrefs.getString(homePageBannerStatusKey) ?? 'PENDING';
  }

  String get bannerText {
    if (status == 'PENDING') {
      return 'Try our AI prescription scanner to start your setup.';
    } else if (status == 'IN_PROGRESS') {
      return 'We have identified your medicines in the provided prescription.';
    } else if (status == 'DONE') {
      return 'Setup complete';
    } else {
      return 'Try our AI prescription scanner to start your setup.';
    }
  }

  String get ctaText {
    if (status == 'PENDING') {
      return 'Scan prescription';
    } else if (status == 'IN_PROGRESS') {
      return 'Continue Setup';
    } else if (status == 'DONE') {
      return 'Setup complete';
    } else {
      return 'Try our AI prescription scanner to start your setup.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      decoration: BoxDecoration(
        color: SystemColors.homePageBannerColor,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 4),
                  Text(
                    'Quick Setup',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: CPFont.fontFamily,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.bolt,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Text(
              bannerText,
              style: const TextStyle(
                fontFamily: CPFont.fontFamily,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
                backgroundColor: Colors.black,
              ),
              onPressed: startSetup,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ctaText,
                    style: const TextStyle(
                      color: SystemColors.mintCream,
                      fontFamily: CPFont.fontFamily,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_outlined,
                    color: SystemColors.mintCream,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startSetup() async {
    if (status == 'PENDING' || status == 'IN_PROGRESS') {
      final capturedImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 3,
      );
      if (capturedImage == null) return;
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/scannedMeds', arguments: capturedImage);
      sharedPrefs.setString(homePageBannerStatusKey, 'IN_PROGRESS');
    } else {
      Navigator.of(context).pushNamed('/addedMeds');
    }
  }
}
