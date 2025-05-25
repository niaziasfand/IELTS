import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilet/Model/modelQnA.dart';
//import 'package:ilet/view/screens/home/course.dart';
//import 'package:ilet/view/screens/home/course_question.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_styling.dart';
import '../../widget/Custom_button_widget.dart';
import '../../widget/Custom_divider_widget.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';

class QuestionAnswer extends StatefulWidget {
  final String Question;
  final String Answer1;
  final String Answer2;
  final String Answer3;
  final String Id;
  final String TopicName;
  final String CourseId;

  const QuestionAnswer({
    super.key,
    required this.Question,
    required this.Answer1,
    required this.Answer2,
    required this.Answer3,
    required this.Id,
    required this.TopicName,
    required this.CourseId,
  });

  @override
  State<QuestionAnswer> createState() => _QuestionAnswerState();
}

class _QuestionAnswerState extends State<QuestionAnswer> {
  bool _showSampleAnswer = false;
  // final answerStream = FirebaseFirestore.instance.collection('Art').snapshots();

  Future<QuestionAnswerModel?> fetchAnswer(
      String id, String coursetitle) async {
    final doc = await FirebaseFirestore.instance
        .collection('Newtopics')
        .doc(widget.TopicName)
        .collection('Courses')
        .doc(
            widget.CourseId) // Use the course id directly to fetch the question
        .collection('Questions')
        .doc(id) // Fetch the answer document using the same id
        .get();

    if (doc.exists) {
      return QuestionAnswerModel.fromMap(doc.data());
    } else {
      return null;
    }
  }

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
          text: 'Question with Sample Answers',
          size: 18,
          weight: FontWeight.w600,
        ),
      ),
      body: FutureBuilder<QuestionAnswerModel?>(
        future: fetchAnswer(widget.Id, widget.TopicName),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final Answer = snapshot.data;

          if (Answer == null) {
            return Center(child: Text('No answer found for this question.'));
          }
          return ListView(
            padding: all(context, 15),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: kTertiaryColor,
                        borderRadius: BorderRadius.circular(h(context, 38)),
                      ),
                      child: Padding(
                        padding:
                            symmetric(context, horizontal: 10, vertical: 3),
                        child: CustomText(
                          text: "Question No 1",
                          size: 14,
                          color: kSecondaryColor,
                        ),
                      ),
                    ),
                  ),
                  CustomText(
                    text: widget.Question,
                    paddingTop: 11,
                  ),
                  CustomDivider(
                    color: kPrimaryColor.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: h(context, 15),
                  ),
                  if (!_showSampleAnswer)
                    Center(
                      child: CustomButton(
                        buttonText: "View Sample Answer",
                        height: 31,
                        width: 180,
                        borderRadius: 6,
                        backgroundColor: const Color(0xffB24B4B),
                        onTap: () {
                          setState(() {
                            _showSampleAnswer = true;
                          });
                        },
                      ),
                    ),
                  if (_showSampleAnswer)
                    Padding(
                      padding: EdgeInsets.only(bottom: h(context, 15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
//###########################################################################################
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: kTertiaryColor,
                                borderRadius:
                                    BorderRadius.circular(h(context, 38)),
                              ),
                              child: Padding(
                                padding: symmetric(context,
                                    horizontal: 10, vertical: 3),
                                child: CustomText(
                                  text: "Sample Answer 1",
                                  size: 14,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                          ),
                          CustomText(
                            text: Answer.Answer1,
                            size: 14,
                            paddingTop: 11,
                          ),
//###########################################################################
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: kTertiaryColor,
                                borderRadius:
                                    BorderRadius.circular(h(context, 38)),
                              ),
                              child: Padding(
                                padding: symmetric(context,
                                    horizontal: 10, vertical: 3),
                                child: CustomText(
                                  text: "Sample Answer 2",
                                  size: 14,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                          ),
                          CustomText(
                            text: Answer.Answer2,
                            size: 14,
                            paddingTop: 11,
                          ),

                          //#######################################################################################
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: kTertiaryColor,
                                borderRadius:
                                    BorderRadius.circular(h(context, 38)),
                              ),
                              child: Padding(
                                padding: symmetric(context,
                                    horizontal: 10, vertical: 3),
                                child: CustomText(
                                  text: "Sample Answer 3",
                                  size: 14,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                          ),
                          CustomText(
                            text: Answer.Answer3,
                            size: 14,
                            paddingTop: 11,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
