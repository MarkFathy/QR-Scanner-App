import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

abstract class AppStyles {

  static  TextStyle homeHeader = TextStyle(
    fontSize: 32.sp,
    color: MyColors.whiteColor,
    fontWeight: FontWeight.normal,
  );
  static  TextStyle textStyle18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: MyColors.whiteColor,
  );

  static  TextStyle textStyle19 = TextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeight.bold,
    color: MyColors.blackColor,
  );
  static  TextStyle textStyle14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.greyColor,
  );
  static  TextStyle textStyle20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: MyColors.blackColor,
  );



}
