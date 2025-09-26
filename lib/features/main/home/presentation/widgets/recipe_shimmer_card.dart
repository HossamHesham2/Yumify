import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class RecipeShimmerCard extends StatelessWidget {
  const RecipeShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: 96.h,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            Container(width: 100.w, height: 12.h, color: Colors.grey),
            Container(width: 60.w, height: 12.h, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
