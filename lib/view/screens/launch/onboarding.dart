import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_styling.dart';
import '../../widget/Custom_button_widget.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';
import 'signin.dart';
import 'signup.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      Assets.imagesOnboard1,
      Assets.imagesOnboard2,
      Assets.imagesOnboard3,
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: kTertiaryColor.withOpacity(0.5),
            height: h(context, 380),
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return CommonImageView(
                  imagePath: images[index],
                  fit: BoxFit.contain,
                  height: 380,
                  width: double.infinity,
                );
              },
            ),
          ),
          SizedBox(
            height: h(context, 38),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                height: 4.0,
                width: _currentPage == index ? 30.0 : 30.0,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? kTertiaryColor
                      : const Color(0xff080826).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              );
            }),
          ),
          SizedBox(
            height: h(context, 33),
          ),
          CustomText(
            text: "IELTS",
            size: 28,
            weight: FontWeight.w600,
          ),
          CustomText(
            text:
                "Level up your abilities and chart your career's course by immersing yourself in our distinctive learning experiences.",
            size: 14,
            color: const Color(0xff898D96),
            textAlign: TextAlign.center,
            paddingTop: 14,
            paddingLeft: 25,
            paddingRight: 25,
          ),
          const Spacer(),
          Padding(
            padding: symmetric(
              context,
              horizontal: 25,
            ),
            child: CustomButton(
              buttonText: "Get Started with 1 Month Free",
              onTap: () {
                Get.offAll(() => const SignUp());
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Already have an account? ",
                size: 14,
                color: const Color(0xff898D96),
                textAlign: TextAlign.center,
                paddingTop: 10,
                paddingBottom: 20,
                paddingLeft: 25,
              ),
              CustomText(
                text: "Sign in",
                size: 14,
                color: kTertiaryColor,
                textAlign: TextAlign.center,
                weight: FontWeight.w600,
                paddingTop: 10,
                paddingBottom: 20,
                paddingRight: 25,
                onTap: () {
                  Get.offAll(() => const SignIn());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
