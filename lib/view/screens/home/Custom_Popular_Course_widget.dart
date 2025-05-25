import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_styling.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';

class CustomPopularCourse extends StatelessWidget {
  final String courseName;
  final String topic;
  final String time;
  final String classes;
  final String imagePath;

  const CustomPopularCourse({
    Key? key,
    required this.courseName,
    required this.topic,
    required this.time,
    required this.classes,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(
          h(context, 12),
        ),
        border: Border.all(color: const Color(0xffCED3F4)),
      ),
      child: Padding(
        padding: all(context, 5),
        child: Row(
          children: [
            CommonImageView(
              imagePath: imagePath,
              height: 84,
              width: 78,
              radius: 12,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: w(context, 12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  text: courseName,
                  weight: FontWeight.w600,
                  color: kTertiaryColor,
                ),
                CustomText(
                  text: topic,
                  size: 16,
                  weight: FontWeight.w600,
                  paddingBottom: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonImageView(
                      imagePath: Assets.imagesClock1,
                      height: 12,
                      width: 12,
                      fit: BoxFit.contain,
                    ),
                    CustomText(
                      text: time,
                      color: const Color(0xff69747B),
                      paddingLeft: 12,
                      paddingRight: 16,
                    ),
                    CommonImageView(
                      imagePath: Assets.imagesVideo1,
                      height: 12,
                      width: 12,
                      fit: BoxFit.contain,
                    ),
                    CustomText(
                      text: classes,
                      color: const Color(0xff69747B),
                      paddingLeft: 12,
                    ),
                    SizedBox(
                      width: w(context, 20),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
