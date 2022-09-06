import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

var defualtColor = ColorManager.swatch;

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,

    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightGrey,
    iconTheme: const IconThemeData(
      color: ColorManager.black,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: defualtColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorManager.black,
      selectedIconTheme: IconThemeData(color: ColorManager.black, size: 28.sp),
    ),
    // ripple effect color

    checkboxTheme: CheckboxThemeData(
      side: MaterialStateBorderSide.resolveWith(
          (_) => BorderSide(width: 1, color: ColorManager.checkboxColor)),
      fillColor: MaterialStateProperty.all(ColorManager.primary),
      checkColor: MaterialStateProperty.all(ColorManager.checkboxColor),
    ),
    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: 4.sp),
    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.white,
        elevation: 0,
        // shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
            getRegularStyle(fontSize: 16, color: ColorManager.white)),

    scaffoldBackgroundColor: ColorManager.white,
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all<Color>(ColorManager.white),
      trackColor: MaterialStateProperty.all<Color>(ColorManager.black),
      mainAxisMargin: 20.0,
      interactive: true,
      radius: Radius.circular(8.r),
    ),
    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightGrey),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(color: ColorManager.white, fontSize: 17),
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)))),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: defualtColor,
    ),

    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(color: ColorManager.grey, fontSize: 16),
        headlineLarge: getSemiBoldStyle(color: ColorManager.grey, fontSize: 16),
        headlineMedium: getRegularStyle(color: ColorManager.grey, fontSize: 14),
        titleMedium: getMediumStyle(color: ColorManager.primary, fontSize: 16),
        bodyLarge: getRegularStyle(color: ColorManager.grey1),
        bodySmall: getRegularStyle(color: ColorManager.grey)),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: EdgeInsets.all(8.sp),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.grey, fontSize: 14),
        labelStyle: getMediumStyle(color: ColorManager.grey, fontSize: 14),
        errorStyle: getRegularStyle(color: ColorManager.error),

        //
        // // enabled border style
        // enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(8.r))),
        //
        // // focused border style
        // focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(8.r))),
        //
        // // error border style
        // errorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: ColorManager.error, width: 1.5.w),
        //     borderRadius: BorderRadius.all(Radius.circular(8.r))),
        // // focused border style
        // focusedErrorBorder: OutlineInputBorder(
        //     // borderSide:
        //     //     BorderSide(color: ColorManager.primary, width: 1.5.w),
        //     borderRadius: BorderRadius.all(Radius.circular(8.r))),
    ),
    // label style
  );
}
