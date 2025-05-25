// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_styling.dart';
import '../../widget/Custom_button_widget.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';
import '../bottombar/bottombar.dart';

class Verfication extends StatefulWidget {
  const Verfication({Key? key});

  @override
  State<Verfication> createState() => _VerficationState();
}

class _VerficationState extends State<Verfication> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: w(context, 54),
      height: h(context, 54),
      textStyle: TextStyle(
        fontSize: f(context, 26),
        color: kPrimaryColor,
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        border: Border.all(
          color: const Color(0xffD8DADC),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(h(context, 10)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: kTertiaryColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(h(context, 10)),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: kTertiaryColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(h(context, 10)),
    );

    return Scaffold(
      backgroundColor: const Color(0xffF2F4FA),
      appBar: AppBar(
        backgroundColor: const Color(0xffF2F4FA),
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
          text: 'Verification',
          size: 20,
          weight: FontWeight.w500,
        ),
        leadingWidth: w(context, 50),
      ),
      body: ListView(
        padding: symmetric(
          context,
          horizontal: 20,
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h(context, 12),
              ),
              CommonImageView(
                imagePath: Assets.imagesIconsucess,
                height: 140,
                width: 260,
                fit: BoxFit.contain,
              ),
              CustomText(
                text: 'Verification Code',
                size: 16,
                weight: FontWeight.w600,
                paddingTop: 48,
              ),
              CustomText(
                text: 'We have sent the code to',
                size: 16,
                color: const Color(0xff9D9D9D),
                weight: FontWeight.w500,
              ),
              CustomText(
                text: 'abcdefg.hijk@gmail.com',
                size: 16,
              ),
              SizedBox(
                height: h(context, 25),
              ),
              Pinput(
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                length: 5,
                validator: (s) {
                  return s == '12345' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) {
                  Get.to(() => const BottomAppBar());
                },
              ),
              SizedBox(
                height: h(context, 48),
              ),
              CustomButton(
                buttonText: 'Next',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          width: w(context, 350),
                          height: h(context, 350),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(h(context, 20)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonImageView(
                                imagePath: Assets.imagesSucess,
                                height: 74,
                                width: 74,
                                fit: BoxFit.contain,
                              ),
                              CustomText(
                                text: 'Register Successfully',
                                size: 16,
                                paddingTop: 21,
                                weight: FontWeight.w600,
                              ),
                              CustomText(
                                text:
                                    "Congratulations! Your account created successfully. Now you can get amazing experience with our services.",
                                size: 14,
                                textAlign: TextAlign.center,
                                paddingTop: 18,
                                paddingBottom: 25,
                                color: const Color(0xff62686B),
                              ),
                              Padding(
                                padding: symmetric(context, horizontal: 20),
                                child: CustomButton(
                                  buttonText: "Done",
                                  onTap: () {
                                    Get.offAll(() => const BottomNavBar());
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                textColor: kWhiteColor,
                backgroundColor: kTertiaryColor,
              ),
              SizedBox(
                height: h(context, 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Didn’t receive the code? ",
                    color: const Color(0xff8C8C8C),
                    size: 12,
                    weight: FontWeight.w500,
                  ),
                  CustomText(
                    text: "Resend",
                    size: 12,
                    weight: FontWeight.w600,
                    color: kQuadColor,
                    decoration: TextDecoration.underline,
                    decorationColor: kQuadColor,
                    onTap: () {
                      Get.offAll(() => ());
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
