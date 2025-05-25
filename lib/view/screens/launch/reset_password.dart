// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_styling.dart';
import '../../widget/Custom_Textfield_widget.dart';
import '../../widget/Custom_button_widget.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';
import 'signin.dart';
//import 'verfication.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F4FA),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F4FA),
        leading: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: CommonImageView(
              imagePath: Assets.imagesArrowback,
              fit: BoxFit.contain,
              height: 10,
              width: 10,
            ),
          ),
        ),
        centerTitle: true,
        title: CustomText(
          text: 'Reset Password',
          size: 20,
          weight: FontWeight.w500,
        ),
        leadingWidth: w(context, 50),
      ),
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
                CustomText(
                  text: "Password",
                  size: 14,
                  paddingBottom: 4,
                ),
                CustomTextField2(
                  hintText: 'Enter your Password',
                  isIcon: true,
                ),
                SizedBox(
                  height: h(context, 22),
                ),
                CustomText(
                  text: "Confirm Password",
                  size: 14,
                  paddingBottom: 4,
                ),
                CustomTextField2(
                  hintText: 'Enter your Password',
                  isIcon: true,
                ),
                SizedBox(
                  height: h(context, 78),
                ),
                CustomButton(
                  buttonText: 'Reset Password',
                  onTap: () {
                    Get.offAll(() => SignIn());
                  },
                  textColor: kWhiteColor,
                  backgroundColor: kTertiaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
