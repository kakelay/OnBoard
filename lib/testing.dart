import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jotpark_flutter/app/cores/values/app_colors.dart';
import 'package:jotpark_flutter/app/cores/values/app_strings.dart';
import 'package:jotpark_flutter/app/routes/app_pages.dart';
import 'package:jotpark_flutter/app/shared_widgets/base_scaffold_with_appicon.dart';
import 'package:jotpark_flutter/app/shared_widgets/text_widget.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});
  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage>
    with TickerProviderStateMixin {
  final List<String> titles = [
    'What’s the JotPark?',
    'Online/Offline QR Code',
    'Track Your Active Parking',
    'Parking Zone Locator',
    'Vehicle Management',
  ];
  final List<String> descriptions = [
    'Transforms the fragile and insecure PAPER parking ticket into a secure digital paperless and eco-friendly parking ticket.',
    'Show QR code to merchant to check-in/out without worrying about your internet connection.',
    'Effortlessly manage and track your parking information with our intuitive system and control over your parking activities.',
    'Pinpoint your desired parking area swiftly and accurately with our comprehensive zone location feature.',
    "Manage your vehicles with our intuitive 'My Vehicle' feature and enabling seamless tracking of parking history.",
  ];
  int currentIndex = 0;
  final List<String> imagePaths = [
    ImagePath.phone,
    ImagePath.qrcode,
    ImagePath.time,
    ImagePath.map,
    ImagePath.vehicelImages,
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWithAppIcon(
      action: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.initialRoute);
            },
            child: TextWidget(
              'Skip to Setup PIN',
              fontSize: 16,
              color: AppColors.green27AE60,
              weight: FontWeight.w600,
            ),
          ),
        ),
      ],
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: TabController(
                length: titles.length,
                vsync: this,
                initialIndex: currentIndex,
              ),
              children: [
                for (int i = 0; i < titles.length; i++)
                  OnboardingPageView(
                    titles[i],
                    descriptions[i],
                    imagePaths[i],
                  ),
              ],
            ),
          ),
          if (currentIndex != 5)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentIndex > 0)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex--;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(48),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.greyE0E0E0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppColors.black1D1D23,
                              size: 32,
                            ),
                            onPressed: () {
                              setState(() {
                                currentIndex--;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                if (currentIndex == 4)
                  Container(
                    margin: const EdgeInsets.all(30.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.green27AE60),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: AppColors.white,
                    ),
                    child: TextWidget(
                      "Setup PIN",
                      fontSize: 16,
                      weight: FontWeight.w600,
                      color: AppColors.green27AE60,
                    ),
                  )
                else
                  const Text(''),
                if (currentIndex < 4)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex++;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(48),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.green,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: AppColors.white,
                              size: 32,
                            ),
                            onPressed: () {
                              setState(() {
                                currentIndex++;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView(
    this.title,
    this.description,
    this.imagePath, {
    super.key,
  });
  final String title;
  final String description;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
          ),
          const SizedBox(height: 20),
          const Text(
            'indicator',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
