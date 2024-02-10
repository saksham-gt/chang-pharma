import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({super.key});

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
            const Text(
              'We have identified your medicines in the provided prescription.',
              style: TextStyle(
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
              onPressed: () async {
                final capturedImage = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                  imageQuality: 3,
                );
                if (capturedImage == null) return;
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, '/scannedMeds',
                    arguments: capturedImage);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue Setup',
                    style: TextStyle(
                      color: SystemColors.mintCream,
                      fontFamily: CPFont.fontFamily,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
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
}
