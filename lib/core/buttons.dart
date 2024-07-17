import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1/core/text_styles.dart';

import 'colors.dart';



class DefaultButton extends StatelessWidget {
   const DefaultButton({required this.text1,super.key,required this.onPressed});
   final String text1;
   final VoidCallback? onPressed;

   @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color:MyColors.orangeColor
      ),
      child: TextButton(onPressed: onPressed,child: Text(text1,
      style:AppStyles.textStyle18
      ),
      ),
    );
  }
}




class BackBtn extends StatelessWidget {
  final Color color;

  const BackBtn({super.key, 
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_new),
      color: MyColors.orangeColor,
    );
  }
}
