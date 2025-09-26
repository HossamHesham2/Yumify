import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';
import 'package:recipes_generator/core/utils/poppins_style_manager.dart';

class CustomRecipeItem extends StatelessWidget {
  final void Function()? onTap;
  final String nameOfRecipe;

  const CustomRecipeItem({super.key, this.onTap, required this.nameOfRecipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorsManager.green4C,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 10.w,
        children: [
          Text(
            nameOfRecipe,
            style: PoppinsStyleManager.medium(color: ColorsManager.white),
          ),

          GestureDetector(
            onTap: onTap,
            child: Icon(Icons.close, color: ColorsManager.white, size: 15.sp),
          ),
        ],
      ),
    );
  }
}
