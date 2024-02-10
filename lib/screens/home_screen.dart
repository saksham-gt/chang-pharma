import 'package:carousel_slider/carousel_slider.dart';
import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      minRadius: 24,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        maxRadius: 22,
                        minRadius: 22,
                        backgroundColor: Colors.black,
                        child: ClipOval(
                          child: Image.asset("assets/images/yash_square.jpeg"),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        color: SystemColors.mintCream,
                      ),
                      onPressed: onNotificationsButtonClicked,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
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
                          onPressed: () {},
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
                ),
                const SizedBox(height: 40),
                const Text(
                  'Quick Actions',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                CarouselSlider(
                  items: [
                    InkWell(
                      onTap: () => _launchUrl(Uri.parse(
                          "https://www.google.com/maps/search/Pharmacies")),
                      child: Container(
                        height: 32.0,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: SystemColors.bannerSecondaryColor,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                maxRadius: 24,
                                minRadius: 24,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  'Pharmacies Nearby',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontFamily: CPFont.fontFamily,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: SystemColors.bannerSecondaryColor,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () => _launchUrl(Uri.parse("tel:112")),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                maxRadius: 24,
                                minRadius: 24,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.sos_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  'Raise emergency',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontFamily: CPFont.fontFamily,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: SystemColors.bannerSecondaryColor,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CircleAvatar(
                              maxRadius: 24,
                              minRadius: 24,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.camera,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  '/scannedMeds',
                                ),
                                child: const Text(
                                  'Scan prescription',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontFamily: CPFont.fontFamily,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    aspectRatio: 4,
                    padEnds: false,
                    viewportFraction: 0.6,
                    autoPlay: false,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  height: 100.0,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: SystemColors.secondaryBannerColor,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          maxRadius: 24,
                          minRadius: 24,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.notifications_active_outlined,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            'Manage reminders',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: CPFont.fontFamily,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/formForMed',
                  ),
                  child: Container(
                    height: 100.0,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: SystemColors.secondaryBannerColor,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            maxRadius: 24,
                            minRadius: 24,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.medication_outlined,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              'Add medicines',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontFamily: CPFont.fontFamily,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 100.0,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: SystemColors.secondaryBannerColor,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          maxRadius: 24,
                          minRadius: 24,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.video_call_outlined,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            'Doctor appointments',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: CPFont.fontFamily,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // PrescriptionPicker(),
                // ReminderScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onNotificationsButtonClicked() {}

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
