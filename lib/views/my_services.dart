import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../globals/app_assets.dart';
import '../globals/app_buttons.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';
import '../helper class/helper_class.dart';
import '../widgets/profile_animation.dart';

import '../globals/app_text_styles.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  bool isApp = false, isGraphic = false, isDataAnalyst = false;

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isApp = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Native App Development',
              asset: AppAssets.kotlin,
              hover: isApp,
              details: 'Mid-level app developer in Java and Kotlin, seeking greater comfort and mastery in crafting mobile applications'
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isGraphic = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Flutter App development',
              asset: AppAssets.flutter,
              hover: isGraphic,
              details: 'An accomplished Flutter developer with a proven track record of delivering top-notch mobile applications. Proficient in creating intuitive and feature-rich user interfaces, ensuring exceptional user experiences. Well-versed in utilizing Flutter capabilities to design and implement complex functionalities'
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isDataAnalyst = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'IOS App development',
              asset: AppAssets.apple,
              hover: isDataAnalyst,
              details: 'Experienced hybrid app developer who has successfully launched two applications on the iOS App Store, catering to the Australian market.'
            ),
          )
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Native App Development',
                  asset: AppAssets.kotlin,
                  hover: isApp,
                  details: 'Mid-level app developer in Java and Kotlin, seeking greater comfort and mastery in crafting mobile applications'
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isGraphic = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Flutter App development',
                  asset: AppAssets.flutter,
                  hover: isGraphic,
                  details: 'An accomplished Flutter developer with a proven track record of delivering top-notch mobile applications. Proficient in creating intuitive and feature-rich user interfaces, ensuring exceptional user experiences. Well-versed in utilizing Flutter capabilities to design and implement complex functionalities'
                ),
              ),
            ],
          ),
          Constants.sizedBox(height: 26.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isDataAnalyst = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'IOS App development',
              asset: AppAssets.apple,
              hover: isDataAnalyst,
              details: 'Experienced hybrid app developer who has successfully launched two applications on the iOS App Store, catering to the Australian market.',
              width: 725.0,
              hoverWidth: 735.0,
            ),
          )
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Native App Development',
                  asset: AppAssets.kotlin,
                  hover: isApp,
                  details: 'Mid-level app developer in Java and Kotlin, seeking greater comfort and mastery in crafting mobile applications'
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isGraphic = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Flutter App development',
                  asset: AppAssets.flutter,
                  details: 'An accomplished Flutter developer with a proven track record of delivering top-notch mobile applications. Proficient in creating intuitive and feature-rich user interfaces, ensuring exceptional user experiences. Well-versed in utilizing Flutter capabilities to design and implement complex functionalities',
                  hover: isGraphic,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isDataAnalyst = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'IOS App development',
                  asset: AppAssets.apple,
                  details: 'Experienced hybrid app developer who has successfully launched two applications on the iOS App Store, catering to the Australian market.',
                  hover: isDataAnalyst,
                ),
              )
            ],
          ),
        ],
      ),
      paddingWidth: size.width * 0.04,
      bgColor: AppColors.bgColor,
    );
  }

  FadeInDown buildMyServicesText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Services',
              style: AppTextStyles.headingStyles(
                  fontSize: 30.0, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer({
    required String title,
    required String asset,
    required bool hover,
    required String details,
    double width = 350,
    double hoverWidth = 360,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: hover ? hoverWidth : width,
      height: hover ? 390 : 380,
      alignment: Alignment.center,
      transform: hover ? onHoverActive : onHoverRemove,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.bgColor2,
        borderRadius: BorderRadius.circular(30),
        border:
            hover ? Border.all(color: AppColors.themeColor, width: 3) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 4.0,
            blurRadius: 4.5,
            offset: Offset(3.0, 4.5),
          )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            asset,
            width: 50,
            height: 50,
            color: AppColors.themeColor,
          ),
          Constants.sizedBox(height: 30.0),
          Text(
            title,
            style: AppTextStyles.montserratStyle(
                color: Colors.white, fontSize: 22.0),
          ),
          Constants.sizedBox(height: 12.0),
          Text(
            details,
            style: AppTextStyles.normalStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 6.0),
          AppButtons.buildMaterialButton(buttonName: 'Read More', onTap: () {})
        ],
      ),
    );
  }
}
