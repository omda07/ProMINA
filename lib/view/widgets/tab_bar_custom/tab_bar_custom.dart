import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';

class TabBarCustom extends StatelessWidget {
  List<Widget> widgets;
  List<Tab> myTabs;
  Function(int index)? onTap;
  dynamic radius;
  bool? normalTab;

  TabBarCustom(
      {required this.myTabs,
      required this.widgets,
      this.onTap,
      this.radius = 8,
      this.normalTab = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        animationDuration: const Duration(milliseconds: 800),
        length: myTabs.length,
        initialIndex: DateTime.now().day - 1,
        child: Column(
          children: [
            normalTab!
                ? ButtonsTabBar(
                    duration: 850,
                    backgroundColor: ColorManager.primary,
                    unselectedBackgroundColor: ColorManager.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
                    height: 60.h,
                    onTap: (int index) {
                      onTap == null ? null : onTap!(index);
                    },
                    labelStyle: TextStyle(
                        color: ColorManager.white, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(
                        color: ColorManager.primary,
                        fontWeight: FontWeight.bold),
                    borderWidth: 1.5,
                    unselectedBorderColor: ColorManager.primary,
                    borderColor: Colors.transparent,
                    radius: 8.r,
                    tabs: myTabs,
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0.w),
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: ColorManager.primary,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: TabBar(
                        onTap: (int index) {
                          onTap == null ? null : onTap!(index);
                        },
                        tabs: myTabs,
                        labelStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                        enableFeedback: true,
                        labelColor: ColorManager.white,
                        indicator: const BoxDecoration(
                          color: ColorManager.primary,
                        ),
                        unselectedLabelColor: ColorManager.white,
                      ),
                    ),
                  ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: widgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
