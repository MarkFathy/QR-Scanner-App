import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onEditingCompleted;
  final ValueChanged<String>? onFieldSubmitted;
  final bool readOnly;

  const LoginTextField({
    super.key,
    this.controller,
    this.validator,
    this.obsecure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.onEditingCompleted,
    this.onFieldSubmitted,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obsecure,
      onChanged: onChanged,
      onEditingComplete: onEditingCompleted,
      cursorColor: Colors.black,
      readOnly: readOnly,
      decoration: InputDecoration(
        filled: true,
        fillColor:Colors.transparent,
        prefixIcon: prefixIcon,
          //prefixIconColor:Colors.red,
          suffixIcon: suffixIcon,
        //suffixIconColor:Colors.grey,

        border:const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.orangeColor,
            )),
        hintText: hintText,
        hintStyle:const TextStyle(
          color: Colors.grey,
          fontSize:14,
        )

      ),
    );
  }
}

