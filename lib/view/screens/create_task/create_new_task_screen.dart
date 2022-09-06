import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pro_mina_task/view/resources/color_manager.dart';
import 'package:pro_mina_task/view/widgets/app_bar/app_bar_custom.dart';
import 'package:pro_mina_task/view/widgets/elevated_button/elevated_button_custom.dart';
import 'package:pro_mina_task/view/widgets/scaffold_custom/scaffold_custom.dart';
import 'package:pro_mina_task/view/widgets/text_custom/text_custom.dart';
import 'package:pro_mina_task/view/widgets/text_form_field/text_form_field_custom.dart';
import 'package:pro_mina_task/view_model/task/task_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../view_model/task/task_states.dart';

class CreateNewTaskScreen extends StatelessWidget {
  const CreateNewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: AppBarCustom(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: ColorManager.black,
              size: 40,
            ),
          ),
        ],
      ),
      body: BlocConsumer<TaskCubit, TaskStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var taskCubit = TaskCubit.get(context);
          return Padding(
            padding: EdgeInsets.all(20.0.sp),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: taskCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Create New Task Text and Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustom(
                          text: 'Create New Task',
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SvgPicture.asset(
                          'assets/icons/task.svg',
                          color: ColorManager.paragraphColor,
                          height: 40,
                        ),
                      ],
                    ),
                    sizedBox16(),
                    textAndFormField('Task Name', taskCubit.taskNameController),

                    sizedBox16(),

                    // Select Category
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('Select Category'),
                        TextButton(
                            onPressed: () {},
                            child: TextCustom(
                              text: 'See all',
                              color: ColorManager.paragraphColor,
                              decoration: TextDecoration.underline,
                            )),
                      ],
                    ),
                    sizedBox16(),
                    SizedBox(
                      height: 40.sp,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 20.sp,
                            margin: EdgeInsets.only(right: 15.w),
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            decoration: BoxDecoration(
                                color: taskCubit.isCategorySelected(index)
                                    ? ColorManager.primary
                                    : ColorManager.white,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                    color: taskCubit.isCategorySelected(index)
                                        ? ColorManager.primary
                                        : ColorManager.paragraphColor,
                                    width: 1.5)),
                            child: Center(
                              child: TextCustom(
                                text: taskCubit.categoryName[index]['name'],
                                color: taskCubit.isCategorySelected(index)
                                    ? ColorManager.white
                                    : ColorManager.paragraphColor,

                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        },
                        itemCount: taskCubit.categoryName.length,
                      ),
                    ),
                    sizedBox16(),

                    // Select Date
                    text('Date'),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 48.h,
                          padding: EdgeInsets.all(12.sp),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: ColorManager.primary)),
                          ),
                          child: TextCustom(
                            text: DateFormat.MMMMEEEEd()
                                .format(DateTime.parse(taskCubit.selectedDate)),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return SfDateRangePicker(
                                      onSubmit: (v) {
                                        Navigator.pop(context);
                                      },
                                      controller: taskCubit.dateController,
                                      confirmText: 'Done',
                                      cancelText: 'cancel',
                                      showActionButtons: true,
                                      onCancel: () {
                                        Navigator.pop(context);
                                      },
                                      onSelectionChanged:
                                          taskCubit.onSelectionChanged,
                                      selectionMode:
                                          DateRangePickerSelectionMode.single,
                                    );
                                  });
                            },
                            child: CircleAvatar(
                                backgroundColor: ColorManager.primary,
                                radius: 25.r,
                                child: SvgPicture.asset(
                                  'assets/icons/calender.svg',
                                  height: 34.h,
                                  color: ColorManager.white,
                                )))
                      ],
                    ),
                    sizedBox16(),

                    // Select Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text('Start Time'),
                            Row(
                              children: [
                                Container(
                                  height: 48.h,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: ColorManager.primary)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextCustom(
                                        text:
                                            taskCubit.firstTime.format(context),
                                        color: ColorManager.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          taskCubit.selectFirstTime(context);
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: ColorManager.primary,
                                          size: 26.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text('End Time'),
                            Row(
                              children: [
                                Container(
                                  height: 48.h,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: ColorManager.primary)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextCustom(
                                        text: taskCubit.endTime.format(context),
                                        color: ColorManager.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          taskCubit.selectEndTime(context);
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: ColorManager.primary,
                                          size: 26.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    // Description
                    textAndFormField(
                        'Description', taskCubit.taskDescriptionController),

                    SizedBox(
                      height: 20.h,
                    ),

                    // Create Task Button
                    Center(
                      child: ElevatedButtonCustom(
                        text: 'Create Task',
                        textColor: ColorManager.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        width: 80.w,
                        onPressed: () {
                          if (taskCubit.formKey.currentState!.validate()) {}
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget text(String title) {
    return TextCustom(
      text: title,
      color: ColorManager.subText,
      fontSize: 18.sp,
    );
  }

  Widget sizedBox16() {
    return SizedBox(
      height: 16.h,
    );
  }

  Widget textAndFormField(
      String title, TextEditingController textEditingController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(title),
        TextFormFieldCustom(
          controller: textEditingController,
          validate: (v) {
            if (v!.isEmpty) {
              return 'Please enter $title';
            }
            return null;
          },
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
