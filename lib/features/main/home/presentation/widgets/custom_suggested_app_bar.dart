import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';
import 'package:recipes_generator/core/utils/font_manager.dart';
import 'package:recipes_generator/core/utils/poppins_style_manager.dart';

class CustomSuggestedAppBar extends StatelessWidget {
  const CustomSuggestedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.orangeF7,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: 50.h,
        top: 60.h,
        right: 16.w,
        left: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, size: 25.sp, color: ColorsManager.white)),
          Text(
            'Suggested Recipes',
            style: PoppinsStyleManager.bold(
              color: ColorsManager.white,
              fontSize: FontSizeManager.s24,
            ),
          ),
          Icon(Icons.search, size: 25.sp, color: ColorsManager.white),
        ],
      ),
    );
  }
}
