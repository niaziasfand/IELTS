import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ilet/constants/app_colors.dart';
import 'package:ilet/constants/app_images.dart';
import 'package:ilet/constants/app_styling.dart';
import 'package:ilet/view/widget/Custom_text_widget.dart';
import 'package:ilet/view/widget/common_image_view_widget.dart';

class Favorite extends StatelessWidget {
  const Favorite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kQuadColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: CustomText(
          text: "Favorite Courses",
          size: 18,
          weight: FontWeight.w600,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Newtopics').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final topics = snapshot.data!.docs;

          return ListView.builder(
            itemCount: topics.length,
            itemBuilder: (context, index) {
              String topicName = topics[index].id;

              return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Newtopics')
                    .doc(topicName)
                    .collection('Courses')
                    .where('IsFav', isEqualTo: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final favorites = snapshot.data!.docs;

                  if (favorites.isEmpty) {
                    return SizedBox
                        .shrink(); // or display a message if there are no favorites
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: CustomText(
                          text: topicName,
                          size: 20,
                          weight: FontWeight.w700,
                        ),
                      ),
                      Column(
                        children: favorites.map((doc) {
                          String courseName = doc[
                              'name']; // Assuming 'name' is the field in Firestore
                          String imageURL = doc[
                              'imageURL']; // Adjust as per your Firestore structure

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              height: h(context, 150),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(imageURL),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(
                                  h(context, 8),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CommonImageView(
                                          imagePath: Assets.imagesHeart,
                                          fit: BoxFit.contain,
                                          height: 24,
                                          width: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomText(
                                      text: courseName,
                                      size: 20,
                                      weight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
