// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_styling.dart';
import '../../widget/Custom_Social_Media_Containear_widget.dart';
import '../../widget/Custom_Textfield_widget.dart';
import '../../widget/Custom_button_widget.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';
import 'verfication.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F4FA),
      body: SafeArea(
        child: ListView(
          padding: all(context, 16),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h(context, 10),
                ),
                Center(
                  child: CustomText(
                    text: "Welcome to ARC Academy",
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                ),
                CustomText(
                  text: "Create an Account to Start Learning",
                  size: 28,
                  weight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: h(context, 20),
                ),
                CustomText(
                  text: "Username",
                  size: 14,
                  paddingBottom: 4,
                ),
                CustomTextField2(
                  hintText: 'Enter your username',
                ),
                SizedBox(
                  height: h(context, 20),
                ),
                CustomText(
                  text: "Email or Phone number",
                  size: 14,
                  paddingBottom: 4,
                ),
                CustomTextField2(
                  hintText: 'Enter your email or number',
                ),
                SizedBox(
                  height: h(context, 20),
                ),
                CustomText(
                  text: "Password",
                  size: 14,
                  paddingBottom: 4,
                ),
                CustomTextField2(
                  hintText: 'Password',
                  isIcon: true,
                ),
                SizedBox(
                  height: h(context, 24),
                ),
                CustomButton(
                  buttonText: 'Create Account',
                  onTap: () {
                    Get.to(() => Verfication());
                  },
                  textColor: kWhiteColor,
                  backgroundColor: kTertiaryColor,
                ),
                SizedBox(
                  height: h(context, 20),
                ),
                CommonImageView(
                  imagePath: Assets.imagesOr,
                  height: 20,
                  width: double.infinity,
                ),
                SizedBox(
                  height: h(context, 20),
                ),
                CustomSocialMediaContainer(
                  imagePath: Assets.imagesGoogle1,
                  name: 'Continue with google',
                  onTap: () {},
                ),
                SizedBox(
                  height: h(context, 8),
                ),
                CustomSocialMediaContainer(
                  imagePath: Assets.imagesFacebook,
                  name: 'Continue with facebook',
                  onTap: () {},
                ),
                SizedBox(
                  height: h(context, 8),
                ),
                CustomSocialMediaContainer(
                  imagePath: Assets.imagesApple1,
                  name: 'Continue with Apple',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
