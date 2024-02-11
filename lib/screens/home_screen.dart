import 'package:carousel_slider/carousel_slider.dart';
import 'package:changpharma/models/medicine.dart';
import 'package:changpharma/screens/notifications_screen.dart';
import 'package:changpharma/screens/widgets/home_screen_banner.dart';
import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() async {
    final String mobile = (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)['phone'] as String;
    // sharedPrefs.setString("phone", mobile);
    // await apiClient.getUserByNumber(mobile);
    super.didChangeDependencies();
  }

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
                    InkWell(
                      onTap: () => Navigator.of(context).pushNamed('/profile'),
                      child: const CircleAvatar(
                        maxRadius: 24,
                        minRadius: 24,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.account_circle_outlined,
                          size: 48,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        color: SystemColors.mintCream,
                      ),
                      onPressed: () => onNotificationsButtonClicked(context),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const HomeScreenBanner(),
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
                                onTap: () async {
                                  final capturedImage =
                                      await ImagePicker().pickImage(
                                    source: ImageSource.camera,
                                    imageQuality: 5,
                                  );
                                  if (capturedImage == null) return;
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(context, '/scannedMeds',
                                      arguments: capturedImage);
                                },
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
                InkWell(
                  borderRadius: BorderRadius.circular(24.0),
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/manage-reminders',
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
                              Icons.settings,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              'User Preferences',
                              style: TextStyle(
                                fontSize: 18,
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
                InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/addedMeds',
                    arguments: Medicine(),
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
                              'Added medicines',
                              style: TextStyle(
                                fontSize: 18,
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
                              fontSize: 18,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onNotificationsButtonClicked(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => const NotificationsScreen(),
      ),
    );
  }

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
