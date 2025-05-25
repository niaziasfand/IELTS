// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_styling.dart';
import '../../widget/Custom_Label_widget.dart';
import '../../widget/Custom_button_widget.dart';
import '../../widget/Custom_text_widget.dart';
import '../bottombar/bottombar.dart';

class ChooseInterests extends StatefulWidget {
  const ChooseInterests({Key? key}) : super(key: key);

  @override
  _ChooseInterestsState createState() => _ChooseInterestsState();
}

class _ChooseInterestsState extends State<ChooseInterests>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  late List<String> _selectedLabels = [];

  final List<String> labels = [
    'Art',
    'Social change',
    'Philosophy',
    'Photography',
    'Storytelling',
    'Music',
    'Technology',
    'Movies',
    'History',
    'Programming',
    'Health',
    'Travel',
    'Science',
    'Human rights',
    'Gaming',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F4FA),
      body: Padding(
        padding: all(context, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h(context, 40),
            ),
            CustomText(
              text: "Learning for your interest?",
              size: 24,
              weight: FontWeight.w600,
              paddingBottom: 16,
            ),
            CustomText(
              text:
                  "learning experiences crafted to enhance your skills, expand your knowledge, and propel you toward professional excellence.",
              size: 14,
              color: Color(0xff62686B),
            ),
            SizedBox(
              height: h(context, 20),
            ),
            Wrap(
              spacing: 14,
              runSpacing: 10,
              children: List.generate(
                labels.length,
                (index) {
                  return CustomInterestLabel(
                    text: labels[index],
                    isSelected: _selectedLabels.contains(labels[index]),
                    onTap: (selectedLabel) {
                      setState(() {
                        if (_selectedLabels.contains(selectedLabel)) {
                          _selectedLabels.remove(selectedLabel);
                        } else {
                          _selectedLabels.add(selectedLabel);
                        }
                      });
                    },
                  );
                },
              ).toList(),
            ),
            Spacer(),
            CustomButton(
              buttonText: 'Continue',
              onTap: () {
                Get.offAll(() => BottomNavBar());
              },
            ),
          ],
        ),
      ),
    );
  }
}
