import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoliday_assignment/config/color_config.dart';
import 'package:yoliday_assignment/screens/account_screen.dart';
import 'package:yoliday_assignment/screens/home_screen.dart';
import 'package:yoliday_assignment/screens/input_screen.dart';
import 'package:yoliday_assignment/screens/portfolio_screen.dart';



class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;
  int ref = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const PortfolioScreen(),
    const InputScreen(),
    const AccountScreen(),
  ];
  final PageController _pageController = PageController(initialPage: 0);

  void _onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: pages,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            _buildNavItem(
              icon: 'assets/images/svg/home.svg',
              label: 'Home',
              index: 0,
            ),
            _buildNavItem(
              icon: 'assets/images/svg/portfolio.svg',
              label: 'Portfolio',
              index: 1,
            ),
            _buildNavItem(
              icon: 'assets/images/svg/input.svg',
              label: 'Input',
              index: 2,
            ),
            _buildNavItem(
              icon: 'assets/images/svg/home.svg',
              label: 'Profile',
              index: 3,
            ),
          ],
          onTap: _onTabSelected,
          currentIndex: selectedIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: AppColors.selectedIconColor,
          unselectedItemColor: AppColors.iconColor,
          type: BottomNavigationBarType.fixed,
          // selectedLabelStyle: TextStyle(
          //   color: AppColors.selectedIconColor,
          // ),
          // unselectedLabelStyle: TextStyle(
          //   color: AppColors.iconColor,
          // ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({required String icon,required String label, required int index}){
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          if (selectedIndex == index)
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Container(
                width: 25.0,
                height: 3.0,
                color: AppColors.selectedIconColor,  // Color of the line above the selected icon
              ),
            )
          else
            SizedBox(height: 3.0), // Placeholder to keep icons aligned

          SvgPicture.asset(
            icon,
            color: selectedIndex==index?AppColors.selectedIconColor:AppColors.iconColor,
          ),
          Text(
            label,
            style: TextStyle(
              color: selectedIndex==index?AppColors.selectedIconColor:
                  AppColors.iconColor,
            ),
          )
        ],
      ),
      label: label,
    );
  }
}
