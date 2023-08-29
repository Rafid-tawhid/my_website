import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../globals/app_buttons.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';
import '../helper class/helper_class.dart';

class ContactUs extends StatefulWidget {
   ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   final nameCon=TextEditingController();
   final emailCon=TextEditingController();
   final mobileCon=TextEditingController();
   final subjectCon=TextEditingController();
   final msgCon=TextEditingController();


   @override
  void dispose() {
    nameCon.dispose();
    emailCon.dispose();
    mobileCon.dispose();
    subjectCon.dispose();
    msgCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: HelperClass(
        mobile: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildContactText(),
            Constants.sizedBox(height: 40.0),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              elevation: 8,
              child: TextFormField(
                cursorColor: AppColors.white,
                controller: nameCon,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'required field';
                  }
                  else return null;
                },
                style: AppTextStyles.normalStyle(),
                decoration: buildInputDecoration(hintText: 'Full Name'),
              ),
            ),
            Constants.sizedBox(height: 20.0),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              elevation: 8,
              child: TextFormField(
                cursorColor: AppColors.white,
                controller: emailCon,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'required field';
                  }
                  else return null;
                },
                style: AppTextStyles.normalStyle(),
                decoration: buildInputDecoration(hintText: 'Email Address'),
              ),
            ),
            Constants.sizedBox(height: 20.0),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              elevation: 8,
              child: TextFormField(
                cursorColor: AppColors.white,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'required field';
                  }
                  else return null;
                },
                style: AppTextStyles.normalStyle(),
                controller: mobileCon,
                decoration: buildInputDecoration(hintText: 'Mobile Number'),
              ),
            ),
            Constants.sizedBox(height: 20.0),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              elevation: 8,
              child: TextFormField(
                cursorColor: AppColors.white,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'required field';
                  }
                  else return null;
                },
                style: AppTextStyles.normalStyle(),
                controller: subjectCon,
                decoration: buildInputDecoration(hintText: 'Email Subject'),
              ),
            ),
            Constants.sizedBox(height: 20.0),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              elevation: 8,
              child: TextFormField(
                maxLines: 15,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'required field';
                  }
                  else return null;
                },
                cursorColor: AppColors.white,
                style: AppTextStyles.normalStyle(),
                controller: msgCon,
                decoration: buildInputDecoration(hintText: 'Your Message'),
              ),
            ),
            Constants.sizedBox(height: 40.0),
            AppButtons.buildMaterialButton(
                buttonName: 'Send Message', onTap: () async {
              print('OKK ${nameCon.text}');

                  if(_formKey.currentState!.validate()){
                    sendEmail();
                  }
            }),
            Constants.sizedBox(height: 30.0),
          ],
        ),
        tablet: buildForm(),
        desktop: buildForm(),
        paddingWidth: size.width * 0.2,
        bgColor: AppColors.bgColor,
      ),
    );
  }

   Column buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildContactText(),
        Constants.sizedBox(height: 40.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextFormField(
                  controller: nameCon,
                  validator: (value){

                    if(value==null||value.isEmpty){
                      return 'required field';
                    }
                    else return null;
                  },
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),

                  decoration: buildInputDecoration(hintText: 'Full Name'),
                ),
              ),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'required field';
                    }
                    else return null;
                  },
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  controller: emailCon,
                  decoration: buildInputDecoration(hintText: 'Email Address'),
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'required field';
                    }
                    else return null;
                  },
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  controller: mobileCon,
                  decoration: buildInputDecoration(hintText: 'Mobile Number'),
                ),
              ),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'required field';
                    }
                    else return null;
                  },
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  controller: subjectCon,
                  decoration: buildInputDecoration(hintText: 'Email Subject'),
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          elevation: 8,
          child: TextFormField(
            validator: (value){
              if(value==null||value.isEmpty){
                return 'required field';
              }
              else return null;
            },
            maxLines: 15,
            cursorColor: AppColors.white,
            style: AppTextStyles.normalStyle(),
            controller: msgCon,
            decoration: buildInputDecoration(hintText: 'Your Message'),
          ),
        ),
        Constants.sizedBox(height: 40.0),
        AppButtons.buildMaterialButton(
            buttonName: 'Send Message', onTap: () {
              print('sdsdsdsdsdsd');
              if(_formKey.currentState!.validate()){
                sendEmail();
              }
        }),
        Constants.sizedBox(height: 30.0),
      ],
    );
  }

  FadeInDown buildContactText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Contact ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Me!',
              style: AppTextStyles.headingStyles(
                  fontSize: 30, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({required String hintText}) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.comfortaaStyle(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: AppColors.bgColor2,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16));
  }

  Future<void> sendEmail() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'rafidtawhid@gmail.com', // Replace with the recipient's email address
      queryParameters: {
        'subject': subjectCon.text, // Replace with your subject
        'body': '${nameCon.text} \n ${mobileCon.text} \n${emailCon.text} \n ${msgCon.text}', // Replace with your email body
      },
    );

    if (await canLaunch(_emailLaunchUri.toString())) {
    await launch(_emailLaunchUri.toString());
    } else {
    throw 'Could not launch email';
    }
  }
}
