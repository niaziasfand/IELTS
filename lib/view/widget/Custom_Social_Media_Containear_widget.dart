import 'package:flutter/material.dart';
import 'package:ilet/constants/app_colors.dart';
import '../../constants/app_styling.dart';
import 'Custom_text_widget.dart';
import 'common_image_view_widget.dart';

class CustomSocialMediaContainer extends StatelessWidget {
  final String imagePath;
  final String name;
  final VoidCallback onTap;

  const CustomSocialMediaContainer({
    required this.imagePath,
    required this.name,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(h(context, 100)),
          border: Border.all(color: const Color(0xffD8DADC)),
          color: kSecondaryColor,
        ),
        child: Padding(
          padding: symmetric(
            context,
            horizontal: 19,
            vertical: 14,
          ),
          child: Row(
            children: [
              CommonImageView(
                imagePath: imagePath,
                fit: BoxFit.contain,
                height: 24,
                width: 24,
              ),
              SizedBox(
                width: w(context, 50),
              ),
              CustomText(
                text: name,
                size: 16,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
