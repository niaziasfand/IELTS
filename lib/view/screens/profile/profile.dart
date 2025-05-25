import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';
import '../../../../constants/app_styling.dart';
import '../../widget/Custom_Textfield_widget.dart';
import '../../widget/Custom_button_widget.dart';
import '../../widget/Custom_drop_down_widget.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kQuadColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: CustomText(
          text: "My Profile",
          size: 18,
          weight: FontWeight.w600,
        ),
      ),
      bottomSheet: Container(
        color: kSecondaryColor,
        child: Padding(
          padding: all(context, 15),
          child: CustomButton(
            buttonText: 'Update',
            onTap: () {
              Get.back();
            },
          ),
        ),
      ),
      body: ListView(
        padding: symmetric(context, horizontal: 20, vertical: 20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    // CommonImageView(
                    //   imagePath: Assets.imagesProfile,
                    //   fit: BoxFit.contain,
                    //   height: 120,
                    //   width: 120,
                    // ),
                    const CircleAvatar(
                      backgroundImage: AssetImage(
                        Assets.imagesProfile,
                      ),
                      foregroundColor: kTertiaryColor,
                      backgroundColor: kTertiaryColor,
                      radius: 60,
                    ),
                    Positioned(
                      bottom: h(context, 5),
                      right: w(context, 10),
                      child: CommonImageView(
                        imagePath: Assets.imagesEdit,
                        fit: BoxFit.contain,
                        height: 25,
                        width: 25,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h(context, 15),
              ),
              const CustomTextField2(
                hintText: 'First Name',
              ),
              SizedBox(
                height: h(context, 16),
              ),
              const CustomTextField2(
                hintText: 'Last Name',
              ),
              SizedBox(
                height: h(context, 16),
              ),
              const CustomTextField2(
                hintText: 'Nick Name',
              ),
              SizedBox(
                height: h(context, 16),
              ),
              const CustomTextField2(
                hintText: '+38  00  9634  2909',
              ),
              SizedBox(
                height: h(context, 16),
              ),
              const CustomDropdown(
                hint: 'Gender',
                items: ['Male', 'Female'],
                selectedValue: null,
              ),
              SizedBox(
                height: h(context, 16),
              ),
              const CustomTextField2(
                hintText: 'Student',
              ),
              SizedBox(
                height: h(context, 80),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
