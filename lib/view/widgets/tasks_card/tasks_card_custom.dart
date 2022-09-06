import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_mina_task/view_model/home/home_cubit.dart';

import '../../resources/color_manager.dart';
import '../text_custom/text_custom.dart';

class TasksCardCustom extends StatelessWidget {
  final int index;
  const TasksCardCustom({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 146.h,
      margin: EdgeInsets.only(bottom: 12.w,),

      child: Stack(
        children: [
          Container(
            height: 130.h,
            margin: EdgeInsets.only(right: 4.w,left: 8.w),
            padding: EdgeInsets.only(right: 16.w),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(14.r),
              boxShadow: const[
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset:  Offset(0, -2), // changes position of shadow
                ),

              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 120.w,
                  width: 120.w,
                  child: SvgPicture.asset(
                    'assets/images/${BlocProvider.of<HomeCubit>(context).taskIconName[index]}.svg',
                    // height: 100.w,

                  ),
                ),
                SizedBox(
                  width: 150.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      TextCustom(
                        text:BlocProvider.of<HomeCubit>(context).taskName[index],
                        color: ColorManager.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextCustom(
                        textAlign: TextAlign.end,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text:
    BlocProvider.of<HomeCubit>(context).taskDescription[index],
                        color: ColorManager.paragraphColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 36.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: ColorManager.black,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12.r),
                  topLeft: Radius.circular(12.r),
                ),
                boxShadow: const[
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset:  Offset(-1, -1), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                  child: TextCustom(
                    text: '10:00 AM',
                    color: ColorManager.white,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
