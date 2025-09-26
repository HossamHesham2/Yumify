import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';
import 'package:recipes_generator/core/utils/font_manager.dart';

class PoppinsStyleManager {
  // Regular
  static TextStyle regular({double? fontSize, Color? color}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? FontSizeManager.s14,
      color: color ?? ColorsManager.black1F,
      fontWeight: FontWeightManager.regular,
    );
  }

  // Medium
  static TextStyle medium({double? fontSize, Color? color}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? FontSizeManager.s14,
      color: color ?? ColorsManager.black1F,
      fontWeight: FontWeightManager.medium,
    );
  }

  // SemiBold
  static TextStyle semiBold({double? fontSize, Color? color}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? FontSizeManager.s14,
      color: color ?? ColorsManager.black1F,
      fontWeight: FontWeightManager.semiBold,
    );
  }

  // Bold
  static TextStyle bold({double? fontSize, Color? color}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? FontSizeManager.s14,
      color: color ?? ColorsManager.black1F,
      fontWeight: FontWeightManager.bold,
    );
  }
}
