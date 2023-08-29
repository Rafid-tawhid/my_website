import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../globals/app_assets.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';
import '../helper class/helper_class.dart';
import '../helper class/project_list.dart';

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  final onH0verEffect = Matrix4.identity()..scale(1.0);

  List images = <String>[
    AppAssets.work1,
    AppAssets.work2,
    AppAssets.work1,
    AppAssets.work2,
    AppAssets.work1,
    AppAssets.work2,
  ];

  List<ProjectList> projectList=[
    ProjectList(image: AppAssets.work1, title: 'Remit Money Transfer',description: 'Money Transfer app for Australia to any country with green id secured verification and other latest functionalities', tools: '[Rest-Api , Google Map location, Secured bearer token,Bio metric verification, Smart UI]'),
    ProjectList(image: AppAssets.work2, title: 'GLO Ticket',description: 'Lottery app to buy, sell and exchange for Malaysian local people', tools: '[Rest-Api, Secured authentication, Awesome animated UI]'),
    ProjectList(image: AppAssets.work1, title: 'Pencilbox Training Institute',description: 'Converting full Functional website through Restfull api With Integrated Payment System and Live functionalities.', tools: '[Rest-Api,Provider,Payment,AamarPay,Bkash,Live Data,Functional Menus,Push Notification]'),
    ProjectList(image: AppAssets.work2, title: 'TexPart Contact App',description: 'Project for Texpart\'s Employee where admin can filter , contact and transfer employees with all log\'s history, ML kit Contact Registration.', tools: '[Firebase backend,Various-Filtering,Admin Panel,call-sms-mail System,ML kit Camera Scanning]'),
    ProjectList(image: AppAssets.work1, title: 'Ecomrs App',description: 'User can chose,search,details & buy any product from a smart UI and add to cart his chosen product. Admin can CRUD products and have a panel of controling the orders and payment', tools: '[FIREBASE , RECYCLERVIEW , SEARCHVIEW , PICASSO, NAVIGATION,TOOLBAR,ADMIN PANEL,CUSTOMER PANEL]'),
    ProjectList(image: AppAssets.work1, title: 'Music Player [Java]',description: 'show all music file and play,pause,running in background,fast-forward with smart UI,Theme Change,Toolbar.', tools: '[ System Services,Custom seekbar,Visualizer,Background services ]'),

  ];

  var hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1)
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2)
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    return GridView.builder(
      itemCount: projectList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 300,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        var project = projectList[index];
        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                if (value) {
                  hoveredIndex = index;
                } else {
                  hoveredIndex = null;
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(project.image,), fit: BoxFit.fill),
                  ),
                ),
                Visibility(
                  visible: index == hoveredIndex,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    transform: index == hoveredIndex ? onH0verEffect : null,
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [
                            AppColors.themeColor.withOpacity(1.0),
                            AppColors.themeColor.withOpacity(0.9),
                            AppColors.themeColor.withOpacity(0.8),
                            AppColors.themeColor.withOpacity(0.6),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    child: Column(
                      children: [
                        Text(project.title,
                          style: AppTextStyles.montserratStyle(
                              color: Colors.black87, fontSize: 20),
                        ),
                        Constants.sizedBox(height: 15.0),
                        Text(project.description,
                          style:
                          AppTextStyles.normalStyle(color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                        Constants.sizedBox(height: 15.0),
                        Text(
                          project.tools,
                          style:
                          AppTextStyles.normalStyle(color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),


                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    maxRadius: 16,
                    backgroundColor: index == hoveredIndex?Colors.white:AppColors.themeColor,
                    child: Image.asset(
                      AppAssets.github,
                      width: 20,
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  FadeInDown buildProjectText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Latest ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Projects',
              style: AppTextStyles.headingStyles(
                  fontSize: 30, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }
}
