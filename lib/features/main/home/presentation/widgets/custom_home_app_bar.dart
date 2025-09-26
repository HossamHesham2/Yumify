import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';
import 'package:recipes_generator/core/utils/font_manager.dart';
import 'package:recipes_generator/core/utils/poppins_style_manager.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

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
        bottom: 30.h,
        top: 60.h,
        right: 16.w,
        left: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Yumify',
            style: PoppinsStyleManager.bold(
              color: ColorsManager.white,
              fontSize: FontSizeManager.s24,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.white.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16.r),
            ),
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.settings,
              size: 25.sp,
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
