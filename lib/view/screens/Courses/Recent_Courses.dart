import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_styling.dart';
import '../../widget/Custom_text_widget.dart';
import '../home/Custom_Ongoing_Course_widget.dart';

class RecentCourses extends StatelessWidget {
  const RecentCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kQuadColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: CustomText(
          text: "Ongoing Courses",
          size: 18,
          weight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: all(context, 10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(
                  5,
                  (index) => const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomOngoingCourse(
                      courseName: "Data Analytics",
                      topic: "Google Data Analytics",
                      time: "45 Min",
                      classes: "26 Classes",
                      progress: 50.0,
                      imagePath: Assets.imagesData,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
