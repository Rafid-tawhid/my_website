import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

import '../globals/app_assets.dart';
import '../globals/app_buttons.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';
import '../helper class/helper_class.dart';
import '../widgets/profile_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socialButtons = <String>[
    AppAssets.facebook,
    AppAssets.linkedIn,
    AppAssets.insta,
    AppAssets.whatsapp,
    AppAssets.github,
  ];

  var socialBI;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildHomePersonalInfo(size),
          Constants.sizedBox(height: 25.0),
          const ProfileAnimation()
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Colors.transparent,
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Tawhidur Rahman Rafid',
            style: AppTextStyles.headingStyles(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                'And I\'m a ',
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [

                  TyperAnimatedText('Freelancer',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue)),
                  TyperAnimatedText('Entrepreneur',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue)),
                  TyperAnimatedText(
                    'Flutter Developer',
                    textStyle:
                    AppTextStyles.montserratStyle(color: Colors.lightBlue),
                  ),
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: Text(
                'I am Passionate to explore the latest technologies and software.'
                ' Love to create Mobile Application with Flutter. '
                'I am a good soldier who can fight in any situation.',
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 22.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            height: 48,
            child: ListView.separated(
              itemCount: socialButtons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, child) =>
                  Constants.sizedBox(width: 8.0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    launchSocialUrl(socialBI);
                  },
                  onHover: (value) {
                    setState(() {
                      if (value) {
                        socialBI = index;

                      } else {
                        socialBI = null;
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(550.0),
                  hoverColor: AppColors.themeColor,
                  splashColor: AppColors.lawGreen,
                  child: buildSocialButton(
                      asset: socialButtons[index],
                      hover: socialBI == index ? true : false),
                );
              },
            ),
          ),
        ),
        Constants.sizedBox(height: 18.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
              onTap: () {
                html.window.open('https://drive.google.com/file/d/1Shn131SqZ7QUKiGDtOd2Q0VMprcXW2Nz/view?usp=share_link', '_blank');
              }, buttonName: 'Download CV'),
        ),
      ],
    );
  }

  Ink buildSocialButton({required String asset, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.themeColor, width: 2.0),
        color: AppColors.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        color: hover ? AppColors.bgColor : AppColors.themeColor,
        // fit: BoxFit.fill,
      ),
    );
  }

  void launchSocialUrl(socialBI) async{
    print('socialBI ${socialBI} ${socialBI.runtimeType}');
    switch (socialBI){
      case 0:
        print('facebook');
        html.window.open('https://www.facebook.com/RAFI5D/', '_blank');

        break;
      case 1:
        print('linkdin');
        html.window.open('https://www.linkedin.com/in/tawhidur-rahman-rafid-5a6b75175/', '_blank');
        break;
      case 2:
        print('insta');
        html.window.open('https://www.instagram.com/rafidtawhid/', '_blank');
        break;
      case 3:
        print('watsweb');
        html.window.open('https://web.whatsapp.com/send?phone=01682832598', '_blank');
        break;
      case 4:
        print('github');
        html.window.open('https://github.com/Rafid-tawhid', '_blank');
        break;
    }
  }
}
