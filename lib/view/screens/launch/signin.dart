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
import 'choose_interests.dart';
import 'forget_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                    text: "Sign in",
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: h(context, 48),
                ),
                CustomText(
                  text: "Email or Phone number",
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
                  text: "Password",
                  size: 14,
                  paddingBottom: 4,
                ),
                CustomTextField2(
                  hintText: 'Password',
                  isIcon: true,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomText(
                    text: "Forgot password ?",
                    size: 14,
                    paddingTop: 5,
                    color: kQuadColor,
                    onTap: () {
                      Get.to(() => ForgetPassword());
                    },
                  ),
                ),
                SizedBox(
                  height: h(context, 24),
                ),
                CustomButton(
                  buttonText: 'Sign in',
                  onTap: () {
                    Get.offAll(() => ChooseInterests());
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
