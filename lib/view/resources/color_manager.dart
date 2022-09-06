import 'package:flutter/material.dart';

class ColorManager {
  static Color swatch = HexColor.fromHex("#4599e1");
  static const Color primary =  Color(0xff4599e1);
  static const Color black =  Color(0xff101010);
  static Color white = const Color(0xffFFFFFF);

  static Color red = const Color(0xffD33D3D);

  static Color grey = const Color(0xff9C9C9C);
  static Color lightGrey = const Color(0xffDDDDDD);
  static Color paragraphColor = const Color(0xff99caf3);

  static Color grey1 = const Color(0xffB9B9B9);

  static Color lightBlue = const Color(0xff5D9FDC);
  static Color dividerColor = const Color(0xffC7C7C7);
  static Color checkboxColor = const Color(0xffECECEC);
  static Color subTitleColor = const Color(0xff656565);
  static Color subText = const Color(0xff7a9ea8);

  static Color textFormBorderColor = const Color(0xff114695);
  static const Color textFormColor =  Color(0xffF1F2F3);
  static Color textFormIconColor = const Color(0xffC0C3C6);
  static Color textFormLabelColor = const Color(0xff456B8D);
  static const Color error =  Color(0xffb71c1c); // red color
  static const Color subContainerColor =  Color(0xffE6E6E6); // red color
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
