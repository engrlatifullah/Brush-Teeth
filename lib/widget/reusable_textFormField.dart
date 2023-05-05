import 'package:brush_teeth/colors.dart';
import 'package:flutter/material.dart';


class ReusableTextFormField extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String ? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcons;
  final bool isPass;
  final int maxLine;
  final TextInputAction ? textInputAction;

  const ReusableTextFormField(
      {Key? key,
      this.hintText,
      this.controller,
      this.keyboardType,
      this.validator,
      this.prefixIcon,
      this.suffixIcons,
       this.isPass = false, this.textInputAction, this.initialValue,  this.maxLine = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: isPass,
      initialValue:initialValue,
      textInputAction: textInputAction,
      maxLines: maxLine,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        filled: true,
        fillColor: lightGreyColor,
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon: suffixIcons,
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
