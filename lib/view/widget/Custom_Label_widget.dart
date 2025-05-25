import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_styling.dart';
import 'Custom_text_widget.dart';

class CustomLabel extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function(String) onTap;

  const CustomLabel({
    Key? key,
    required this.text,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(text),
      child: Container(
        padding: symmetric(context, horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffEAF4FC) : kSecondaryColor,
          borderRadius: BorderRadius.circular(h(context, 30)),
          border: Border.all(
              color: isSelected ? const Color(0xffEAF4FC) : kborderColor,
              width: 1),
        ),
        child: CustomText(
          text: text,
          size: 11,
          weight: FontWeight.w700,
          color: kTertiaryColor,
        ),
      ),
    );
  }
}

class CustomInterestLabel extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function(String) onTap;

  const CustomInterestLabel({
    Key? key,
    required this.text,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(text),
      child: Container(
        padding: symmetric(context, horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? kTertiaryColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(h(context, 130)),
          border: Border.all(
              color: isSelected ? kTertiaryColor : kborderColor, width: 1),
        ),
        child: CustomText(
          text: text,
          size: 16,
          weight: FontWeight.w400,
          color: isSelected ? kSecondaryColor : kPrimaryColor,
        ),
      ),
    );
  }
}
