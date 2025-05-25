import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilet/Model/modelQnA.dart'; // Import your model
//import 'package:ilet/view/screens/home/course.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_styling.dart';
import '../../widget/Custom_divider_widget.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';
import 'question_answers.dart';

class CourseQuestion extends StatelessWidget {
  final String TopicName;
  final String CourseId;
  final DocumentSnapshot courseDoc;

  CourseQuestion({
    Key? key,
    required this.TopicName,
    required this.CourseId,
    required this.courseDoc,
  }) : super(key: key);

  Stream<QuerySnapshot> getQuestionStream(String topicName, String courseId) {
    return FirebaseFirestore.instance
        .collection('Newtopics')
        .doc(topicName)
        .collection('Courses')
        .doc(courseId)
        .collection('Questions')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kQuadColor,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(15),
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
          text: 'Question of Topic: ' + courseDoc['name'],
          size: 18,
          weight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: StreamBuilder<QuerySnapshot>(
          stream: getQuestionStream(TopicName, CourseId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final questions = snapshot.data!.docs
                .map((doc) => QuestionAnswerModel.fromMap(
                    doc.data() as Map<String, dynamic>))
                .toList();

            return ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: kTertiaryColor,
                                    borderRadius:
                                        BorderRadius.circular(h(context, 38)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    child: CustomText(
                                      text: "Question No ${index + 1}",
                                      size: 14,
                                      color: kSecondaryColor,
                                    ),
                                  ),
                                ),
                                CustomText(
                                  text: questions[index].Question,
                                  paddingTop: 10,
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => QuestionAnswer(
                                    Id: questions[index].id,
                                    Question: questions[index].Question,
                                    Answer1: questions[index].Answer1,
                                    Answer2: questions[index].Answer2,
                                    Answer3: questions[index].Answer3,
                                    TopicName: TopicName,
                                    CourseId: CourseId,
                                  ));
                            },
                            child: CommonImageView(
                              imagePath: Assets.imagesNext,
                              height: 20,
                              width: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    CustomDivider(
                      color: kPrimaryColor.withOpacity(0.3),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
