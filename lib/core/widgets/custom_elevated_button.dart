import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';
import 'package:recipes_generator/core/utils/font_manager.dart';
import 'package:recipes_generator/core/utils/poppins_style_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final String? image;
  final IconData? icon;

  const CustomElevatedButton({
    super.key,
    this.onTap,
    required this.text,
    this.image,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(17),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManager.orangeF7,
          borderRadius: BorderRadiusGeometry.circular(16.r),
        ),
        child: Row(
          spacing: 10.w,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null && image!.isNotEmpty) Image.asset(image ?? ""),
            if (icon != null)
              Icon(icon, color: ColorsManager.white, size: 25.sp),
            Text(
              text,
              style: PoppinsStyleManager.semiBold(
                fontSize: FontSizeManager.s18,
                color: ColorsManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
