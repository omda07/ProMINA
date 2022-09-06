import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_mina_task/view/widgets/component.dart';

import '../../resources/color_manager.dart';
import '../text_custom/text_custom.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

 final IconData? iconData;
 final String? text;
 final  Function? onPressed;
 final List<Widget>? actions;
 final bool? isNull;
 final TextAlign? textAlign;
 final  double? fontSize;
 final FontWeight? fontWeight;
 final  bool? centerTitle;
  final Widget? widget;
  const AppBarCustom({Key? key,
    this.iconData = Icons.arrow_back_ios_new,
    this.text = '',
    this. widget,
    this. onPressed,

    this. isNull = true,
    this.  centerTitle=true,
    this. textAlign= TextAlign.center,
    this. fontSize = 18.0,
    this.  fontWeight=FontWeight.w600,
    this.   actions,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      centerTitle: centerTitle,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,

      ),

      leading: isNull!
          ? IconButton(
        onPressed: () {
          onPressed == null ? null : navigatorBack(context);
          navigatorBack(context);
        },
        icon: Icon(
          iconData,
          size: 30.0.sp,
          color: ColorManager.black,
        ),
      )
          : widget,
      title: TextCustom(
        textAlign: textAlign!,

        text: text!,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Colors.black,
      ),
      actions: actions,
    );
  }
}


