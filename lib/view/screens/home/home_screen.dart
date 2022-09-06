import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pro_mina_task/view/resources/color_manager.dart';
import 'package:pro_mina_task/view/widgets/component.dart';
import 'package:pro_mina_task/view/widgets/elevated_button/elevated_button_custom.dart';
import 'package:pro_mina_task/view/widgets/text_custom/text_custom.dart';
import 'package:pro_mina_task/view_model/home/home_cubit.dart';
import 'package:pro_mina_task/view_model/home/home_states.dart';

import '../../widgets/tab_bar_custom/tab_bar_custom.dart';
import '../../widgets/tasks_card/tasks_card_custom.dart';
import 'custom_clipPath.dart';
import '../../widgets/scaffold_custom/scaffold_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: ColorManager.primary,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: ScreenUtil.defaultSize.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          // Drawer and Notification Icons
                          Padding(
                            padding: EdgeInsets.all(20.0.sp),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.menu,
                                        size: 40,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 14.w,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/icons/Notification.svg',
                                        height: 30,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 48.h,
                                ),
                                // My Task and New Task Button
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextCustom(
                                      text: 'My Task',
                                      fontSize: 30.sp,
                                      color: ColorManager.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ElevatedButtonCustom(
                                      width: 16.w,
                                      widget: SvgPicture.asset(
                                          'assets/icons/Icon-plus.svg'),
                                      onPressed: () {
                                        navigator(context, 'createNewTask');
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                // Date of the day
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextCustom(
                                      text: 'Today',
                                      fontSize: 20.sp,
                                      color: ColorManager.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    TextCustom(
                                      text: DateFormat.MMMMEEEEd()
                                          .format(DateTime.now())
                                          .toString(),
                                      color: ColorManager.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),
                          // Week Days
                          BlocConsumer<HomeCubit, HomeStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              var homeCubit = HomeCubit.get(context);
                              return TabBarCustom(
                                onTap: (int tIndex) {
                                  homeCubit.onTap(tIndex);
                                },
                                myTabs: List.generate(
                                  homeCubit.dayListText.length,
                                  (index) => Tab(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextCustom(
                                          text: homeCubit.dayListNum[index],
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: homeCubit.checkDay(index)
                                              ? ColorManager.white
                                              : ColorManager.black,
                                        ),
                                        TextCustom(
                                          text: homeCubit.dayListText[index],
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: homeCubit.checkDay(index)
                                              ? ColorManager.white
                                              : ColorManager.primary,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                widgets: List.generate(
                                  homeCubit.dayListText.length,
                                  (index) => Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 10.h),
                                    width: ScreenUtil.defaultSize.width,
                                    decoration: BoxDecoration(
                                      color: ColorManager.primary,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50.r),
                                      ),
                                    ),
                                    child: Scrollbar(
                                      controller: homeCubit.scrollController,
                                      trackVisibility: true,
                                      thumbVisibility: true,
                                      scrollbarOrientation:
                                          ScrollbarOrientation.left,
                                      thickness: 2.5,
                                      child: ListView.builder(
                                        controller: homeCubit.scrollController,
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return TasksCardCustom(
                                            index: index,
                                          );
                                        },
                                        itemCount:
                                            BlocProvider.of<HomeCubit>(context)
                                                .taskIconName
                                                .length,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    // Right Top Decoration
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SizedBox(
                        width: ScreenUtil.defaultSize.width,
                        height: 800.h,
                        child: ClipPath(
                          clipper: MyClipper(),
                          child: Container(
                            color: ColorManager.primary,
                          ),
                        ),
                      ),
                    ),
                    // Profile Image
                    Padding(
                      padding: EdgeInsets.only(right: 26.w, top: 26.h),
                      child: CircleAvatar(
                        backgroundColor: ColorManager.primary,
                        radius: 25.r,
                        backgroundImage: const AssetImage(
                          'assets/images/profileImage.jpg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
