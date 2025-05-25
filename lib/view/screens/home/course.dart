import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ilet/constants/app_colors.dart';
import 'package:ilet/constants/app_images.dart';
import 'package:ilet/constants/app_styling.dart';

import 'package:ilet/view/screens/home/course_question.dart';
import 'package:ilet/view/widget/Custom_text_widget.dart';
import 'package:ilet/view/widget/common_image_view_widget.dart';

class Course extends StatefulWidget {
  final String TopicName;

  Course({super.key, required this.TopicName});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kQuadColor,
        centerTitle: true,
        leading: Padding(
          padding: all(context, 15),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: CommonImageView(
              imagePath: Assets.imagesBack,
              width: 24,
              height: 24,
            ),
          ),
        ),
        title: CustomText(
          text: widget.TopicName,
          size: 18,
          weight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: all(context, 15),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Newtopics')
              .doc(widget.TopicName)
              .collection('Courses')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final courses = snapshot.data!.docs;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5,
              ),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                DocumentSnapshot courseDoc = courses[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => CourseQuestion(
                          TopicName: widget.TopicName,
                          CourseId: courseDoc.id,
                          courseDoc: courseDoc,
                        ));
                  },
                  child: CourseItem(
                    courseDoc: courseDoc,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  final DocumentSnapshot courseDoc;

  const CourseItem({
    required this.courseDoc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isFav = courseDoc['IsFav'] as bool;
    String imageURL = courseDoc['imageURL'] as String;
    return Container(
      height: h(context, 100),
      decoration: BoxDecoration(
        image:
            DecorationImage(image: NetworkImage(imageURL), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(
          h(context, 8),
        ),
      ),
      child: Padding(
        padding: all(context, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: isFav ? Colors.red : Colors.grey,
                    size: 24,
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('Newtopics')
                        .doc(courseDoc.reference.parent.parent!.id)
                        .collection('Courses')
                        .doc(courseDoc.id)
                        .update({'IsFav': !isFav});
                  },
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomText(
                    text: courseDoc['name'],
                    size: 17,
                    weight: FontWeight.w900,
                 
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
