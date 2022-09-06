import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validate;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final bool obSecure;
  final Widget? prefixIcon;
  final bool prefix;
  final Widget? suffixIcon;
  final bool suffix;
  final Function? suffixOnPressed;
  final TextInputType? keyboardType;
  final int maxDigit;
  final Function? onChanged;
  final TextInputAction? textInputAction;
  final Function? onTab;
  final FocusNode? focus;
  final TextAlign align;
  final String? initial;
  final bool? enable;
  final double? padding;
  final int? maxLines;
  final Color? fillColor;
  final Color? boarderColor;

  const TextFormFieldCustom(
      {Key? key,
      this.controller,
      this.label,
      this.hint,
      this.obSecure = false,
      this.prefixIcon,
      this.prefix = false,
      this.suffixIcon,
      this.suffix = false,
      this.suffixOnPressed,
      required this.validate,
      this.keyboardType,
      this.maxDigit = 100,
      this.onChanged,
      this.textInputAction,
      this.onTab,
      this.onSaved,
      this.onEditingComplete,
      this.focus,
      this.align = TextAlign.start,
      this.initial,
      this.enable,
        this.fillColor = ColorManager.textFormColor,
        this.boarderColor =ColorManager.textFormColor,
      this.padding = 16.0,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      textAlignVertical: TextAlignVertical.center,
      textAlign: align,
      focusNode: focus,
      // autofocus: true,
      enabled: enable,
      initialValue: initial,
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.next,
      onChanged: (value) {
        //onChanged!(value);
        onChanged != null ? onChanged!(value) : null;
      },
      onEditingComplete: onEditingComplete,
      obscureText: obSecure,
      validator: (value) {
        return validate!(value);
      },
      onSaved: onSaved,
      keyboardType: keyboardType,
      cursorColor: ColorManager.black,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
        color: ColorManager.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600
      ),
      onTap: () {
        onTab != null ? onTab!() : null;
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxDigit),
      ],
      //maxLength: maxDigit,
      decoration: InputDecoration(
        filled: false,
        fillColor: fillColor,
        isDense: true,

        contentPadding: EdgeInsets.symmetric(
          vertical: padding!.h,
          horizontal: 16.w,
        ),

        suffixIconColor: ColorManager.textFormIconColor,
        focusColor: ColorManager.textFormColor,

        prefixIcon: prefix
            ? Padding(
                padding: EdgeInsets.all(14.0.sp),
                child: prefixIcon,
              )
            : null,
        suffixIcon: suffix
            ? Padding(
                padding: EdgeInsets.all(14.0.sp),
                child: InkWell(
                  onTap: suffixOnPressed != null
                      ? () {
                          suffixOnPressed!();
                          // suffixOnPressed!();
                        }
                      : null,
                  child: suffixIcon,
                ),
              )
            : null,
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
          color: ColorManager.grey,
          fontSize: 15.sp,
        ),
        floatingLabelStyle: TextStyle(
          color: ColorManager.primary,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
