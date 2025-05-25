import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:ilet/config/routes/routes.dart';
//import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:ilet/constants/app_images.dart';
import 'package:ilet/constants/app_styling.dart';
//import 'package:ilet/view/screens/home/course_question.dart';
import 'package:ilet/view/widget/common_image_view_widget.dart';
import 'package:ilet/view/widget/custom_search_bar_widget.dart';
import '../../../constants/app_colors.dart';
import '../../widget/Custom_Label_widget.dart';
import '../../widget/Custom_text_widget.dart';
import 'Custom_Ongoing_Course_widget.dart';
import 'Custom_Popular_Course_widget.dart';
import 'course.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _selectedLabel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kQuadColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: CustomText(
          text: "Hello, Alexander",
          size: 18,
          weight: FontWeight.w600,
        ),
        bottom: AppBar(
          backgroundColor: kQuadColor,
          automaticallyImplyLeading: false,
          toolbarHeight: h(context, 200),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(child: CustomSearchBar()),
                  SizedBox(
                    width: w(context, 10),
                  ),
                  CommonImageView(
                    imagePath: Assets.imagesFilter,
                    fit: BoxFit.contain,
                    height: 48,
                    width: 48,
                  ),
                ],
              ),
              SizedBox(
                height: h(context, 22),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Topics",
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(h(context, 100)),
                      border: Border.all(color: const Color(0xffB4C9D3)),
                    ),
                    child: Padding(
                      padding: symmetric(context, horizontal: 10, vertical: 5),
                      child: CustomText(
                        text: "See All",
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h(context, 22),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Newtopics')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  final topics = snapshot.data!.docs;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: topics.map((topic) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomInterestLabel(
                            text: topic.id,
                            isSelected: _selectedLabel == topic.id,
                            onTap: (selectedLabel) {
                              setState(() {
                                _selectedLabel = selectedLabel;
                              });

                              Get.to(() => Course(TopicName: topic.id));
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: h(context, 22),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: symmetric(context, vertical: 10, horizontal: 16),
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Ongoing Course",
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffEEF0FB),
                      borderRadius: BorderRadius.circular(h(context, 100)),
                      border: Border.all(color: const Color(0xffB4C9D3)),
                    ),
                    child: Padding(
                      padding: symmetric(context, horizontal: 10, vertical: 5),
                      child: CustomText(
                        text: "See All",
                        weight: FontWeight.w600,
                        color: kTertiaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h(context, 12),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ());
                },
                child: const CustomOngoingCourse(
                  courseName: "Data Analytics",
                  topic: "Google Data Analytics",
                  time: "45 Min",
                  classes: "26 Classes",
                  progress: 50.0,
                  imagePath: Assets.imagesData,
                ),
              ),
              SizedBox(
                height: h(context, 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Popular Course",
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffEEF0FB),
                      borderRadius: BorderRadius.circular(h(context, 100)),
                      border: Border.all(color: const Color(0xffB4C9D3)),
                    ),
                    child: Padding(
                      padding: symmetric(context, horizontal: 10, vertical: 5),
                      child: CustomText(
                        text: "See All",
                        weight: FontWeight.w600,
                        color: kTertiaryColor,
                        onTap: () {
                          Get.to(() => Course(
                                TopicName: '',
                              ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h(context, 12),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CustomPopularCourse(
                        courseName: "Data Analytics $index",
                        topic: "Google Data Analytics",
                        time: "45 Min",
                        classes: "26 Classes",
                        imagePath: Assets.imagesData,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h(context, 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "You may like",
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffEEF0FB),
                      borderRadius: BorderRadius.circular(h(context, 100)),
                      border: Border.all(color: const Color(0xffB4C9D3)),
                    ),
                    child: Padding(
                      padding: symmetric(context, horizontal: 10, vertical: 5),
                      child: CustomText(
                        text: "See All",
                        weight: FontWeight.w600,
                        color: kTertiaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h(context, 12),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: h(context, 100),
                        width: w(context, 200),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(Assets.imagesData),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(
                            h(context, 8),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: all(context, 8),
                              child: CommonImageView(
                                imagePath: Assets.imagesHeart,
                                fit: BoxFit.contain,
                                height: 16,
                                width: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
