import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    Color? color,
    Duration duration = const Duration(seconds: 2),
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    final controller = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 400),
    );

    final animation = Tween<Offset>(
      begin: const Offset(1, 0), // يبدأ من اليمين
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    entry = OverlayEntry(
      builder: (context) => Positioned(
        left: 100,
        right: 10,
        bottom: 80.h,
        child: SlideTransition(
          position: animation,
          child: Material(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    controller.forward();

    // بعد المدة يختفي مع أنيميشن عكسي
    Future.delayed(duration, () async {
      await controller.reverse();
      entry.remove();
      controller.dispose();
    });
  }
}
