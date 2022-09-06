import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

TextStyle _getTextStyle(double fontSize,  Color color) {
  return GoogleFonts.poppins(
 color: color, fontSize: fontSize.sp,decorationColor: ColorManager.white,);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = 12, required Color color}) {
  return _getTextStyle(fontSize, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = 12, required Color color}) {
  return _getTextStyle(fontSize, color);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = 12, required Color color}) {
  return _getTextStyle(fontSize, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = 12, required Color color}) {
  return _getTextStyle(fontSize,  color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = 12, required Color color}) {
  return _getTextStyle(fontSize, color);
}
