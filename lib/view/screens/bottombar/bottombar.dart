import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../favorite/favorite.dart';
import '../profile/profile.dart';
import '../../widget/common_image_view_widget.dart';
import '../Courses/Recent_Courses.dart';
import '../home/home.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PageController _controller = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _buildScreens(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: StylishBottomBar(
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.horizontal,
          bubbleFillStyle: BubbleFillStyle.fill,
          inkColor: const Color(0xffECEEF8),
          opacity: 0.3,
        ),
        iconSpace: 12.0,
        items: [
          BottomBarItem(
            icon: CommonImageView(
              fit: BoxFit.contain,
              imagePath: Assets.imagesHome,
              height: 26,
              width: 26,
            ),
            title: const Text('Home'),
            backgroundColor: kQuadColor,
            selectedColor: kSecondaryColor,
          ),
          BottomBarItem(
            icon: CommonImageView(
              fit: BoxFit.contain,
              imagePath: Assets.imagesBook,
              height: 26,
              width: 26,
            ),
            title: const Text('Courses'),
            backgroundColor: kQuadColor,
            selectedColor: kSecondaryColor,
          ),
          BottomBarItem(
            icon: CommonImageView(
              fit: BoxFit.contain,
              imagePath: Assets.imagesBottomheart,
              height: 26,
              width: 26,
            ),
            title: const Text('Favorite'),
            backgroundColor: kQuadColor,
            selectedColor: kSecondaryColor,
          ),
          BottomBarItem(
            icon: CommonImageView(
              fit: BoxFit.contain,
              imagePath: Assets.imagesBottomprofile,
              height: 26,
              width: 26,
            ),
            title: const Text('Profile'),
            backgroundColor: kQuadColor,
            selectedColor: kSecondaryColor,
          ),
        ],
        hasNotch: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const Home(),
      const RecentCourses(),
      Favorite(),
      const EditProfile(),
    ];
  }
}
