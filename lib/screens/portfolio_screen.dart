import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../config/color_config.dart';
import '../models/project_model.dart';


class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> with SingleTickerProviderStateMixin{

  int selectedTab = 0;
  _selectTab(int index) async{
    setState(() {
      selectedTab = index;
    });
  }
  late TabController _tbCtlr;

  TextEditingController _searchCtrl = TextEditingController();
  List<ProjectModel> filteredProjects = [];

  void _searchProjects() {
    final query = _searchCtrl.text.toLowerCase();
    setState(() {
      filteredProjects = projects.where((project) {
        return project.title.toLowerCase().contains(query) ||
            project.subTitle.toLowerCase().contains(query) ||
            project.subTitle2.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void initState() {
    _tbCtlr = TabController(length: 4, vsync: this, initialIndex: 0);
    filteredProjects = projects;
    _searchCtrl.addListener(_searchProjects);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Portfolio',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500
            ),
          ),
          actions: [
            InkWell(
              onTap: (){},
              child: SvgPicture.asset(
                'assets/images/svg/shopping_bag.svg',
              ),
            ),
            SizedBox(width: 10.sp,),
            InkWell(
              onTap: (){},
              child: SvgPicture.asset(
                'assets/images/svg/notification.svg',
              ),
            ),
            SizedBox(width: 10.sp,),
          ],
         /* bottom: PreferredSize(
            preferredSize: Size(double.infinity, 100),
            child: NavigationBar(
              onDestinationSelected: _selectTab,
              selectedIndex: selectedTab,
              backgroundColor: Colors.transparent,
              // indicatorShape: ShapeBorder,
              destinations: [
                NavigationDestination(
                  icon: Column(
                    children: [
                      Text(
                        'Project',
                        style: TextStyle(
                          color: selectedTab == 0?
                          AppColors.selectedIconColor:AppColors.iconColor,
                        ),
                      ),
                    ],
                  ),
                  label: 'Project',
                ),
                NavigationDestination(
                  icon: Column(
                    children: [
                      Text(
                        'Saved',
                        style: TextStyle(
                          color: selectedTab == 1?
                          AppColors.selectedIconColor:AppColors.iconColor,
                        ),
                      ),
                    ],
                  ),
                  label: 'Project',
                ),
                NavigationDestination(
                  icon: Column(
                    children: [
                      Text(
                        'Shared',
                        style: TextStyle(
                          color: selectedTab == 2?
                          AppColors.selectedIconColor:AppColors.iconColor,
                        ),
                      ),
                    ],
                  ),
                  label: 'Project',
                ),
                NavigationDestination(
                  icon: Column(
                    children: [
                      Text(
                        'Achievement',
                        style: TextStyle(
                          color: selectedTab == 3?
                          AppColors.selectedIconColor:AppColors.iconColor,
                        ),
                      ),
                    ],
                  ),
                  label: 'Project',
                ),
              ],
            ),
          ),*/
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              controller: _tbCtlr,
              isScrollable: false,
              indicatorWeight: 2,
              labelColor: AppColors.selectedIconColor,
              indicatorColor: AppColors.selectedIconColor,
              tabs: [
                // Tab(
                //   text: "Project",
                // ),
                // Tab(
                //   text: "Saved",
                // ),
                // Tab(
                //   text: "Shared",
                // ),
                // Tab(
                //   text: "Achievement",
                // ),
                _tabBar(
                  ind: 0,
                  title: 'Project',
                  size: 12.sp,
                ),
                _tabBar(
                  ind: 1,
                  title: 'Saved',
                  size: 12.sp,
                ),
                _tabBar(
                  ind: 2,
                  title: 'Shared',
                  size: 12.sp,
                ),
                _tabBar(
                  ind: 3,
                  title: 'Achievment',
                  size: 12.sp,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  controller: _tbCtlr,
                  children: [
                    _projectTab(),
                    _savedTab(),
                    _sharedTab(),
                    _achievementTab(),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  List<ProjectModel> projects = [
    ProjectModel(
        title: 'Kemampuan Merangkum Tulisan',
        subTitle: 'BAHASA SUNDA',
        subTitle2: 'Oleh Al-Baiqi Samaan',
        assetImage: 'assets/images/png/content1.png'
    ),
    ProjectModel(
        title: 'Kemampuan Merangkum Tulisan',
        subTitle: 'BAHASA SUNDA',
        subTitle2: 'Oleh Al-Baiqi Samaan',
        assetImage: 'assets/images/png/content2.png'
    ),
    ProjectModel(
        title: 'Kemampuan Merangkum Tulisan',
        subTitle: 'BAHASA SUNDA',
        subTitle2: 'Oleh Al-Baiqi Samaan',
        assetImage: 'assets/images/png/content3.png'
    ),
    ProjectModel(
        title: 'Kemampuan Merangkum Tulisan',
        subTitle: 'BAHASA SUNDA',
        subTitle2: 'Oleh Al-Baiqi Samaan',
        assetImage: 'assets/images/png/content4.png'
    ),
    ProjectModel(
        title: 'Kemampuan Merangkum Tulisan',
        subTitle: 'BAHASA SUNDA',
        subTitle2: 'Oleh Al-Baiqi Samaan',
        assetImage: 'assets/images/png/content5.png'
    ),
  ];

  Widget _projectTab(){
    return Stack(
      children: [
        Column(
          children: [
            Align(
              child: Container(
                width: 343.sp,
                height: 44.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    width: 1.sp,
                    color: AppColors.iconColor,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchCtrl,
                        decoration: const InputDecoration(
                          hintText: "Search a project",
                          hintStyle: TextStyle(
                              color: Color(0xFF9E95A2)
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      height: 28.sp,
                      width: 28.sp,
                      decoration: BoxDecoration(
                          color: AppColors.selectedIconColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: SvgPicture.asset(
                        'assets/images/svg/search.svg',
                        width: 16.sp,
                        height: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              // width: 360.sp,
              // height: 650.sp,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: ListView.builder(
                  itemCount: filteredProjects.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 110.sp,
                        width: 343.sp,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.sp,
                            color: Color(0xFFE0E0E0),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 110.sp,
                              height: 110.sp,
                              child: Image.asset(
                                filteredProjects[index].assetImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(filteredProjects[index].title,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(filteredProjects[index].subTitle,
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(filteredProjects[index].subTitle2,
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 26.sp,
                                          width: 50.sp,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Color(0xFFF39519)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "A",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                color: Colors.white
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 20,
          right: 125.5.sp,
          left: 125.5.sp,
          child: Container(
            width: 124.sp,
            height: 34.sp,
            decoration: BoxDecoration(
              color: AppColors.selectedIconColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(MdiIcons.filterVariant, size: 20.sp,color: Colors.white,),
                // Image.asset(
                //   'assets/images/png/filter.png',
                //   color: Colors.white,
                //   height: 24.sp,
                //   width: 24.sp,
                // ),
                Text(
                  'filter',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _savedTab(){
    return const Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              'Saved Tab',
            ),
          ),
        ),
      ],
    );
  }

  Widget _sharedTab(){
    return const Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "Shared Tab",
            ),
          ),
        ),
      ],
    );
  }

  Widget _achievementTab(){
    return const Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "Achievement Tab",
            ),
          ),
        ),
      ],
    );
  }

  Widget _tabBar({required String title, required int ind, required double size}) {
    return AnimatedBuilder(
      animation: _tbCtlr,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                style: TextStyle(
                  color: _tbCtlr.index == ind ? AppColors.selectedIconColor : Colors.black,
                  fontSize: size,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}
