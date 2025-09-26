import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';
import 'package:recipes_generator/core/utils/font_manager.dart';
import 'package:recipes_generator/core/utils/poppins_style_manager.dart';

class CustomListOfIngredients extends StatefulWidget {
  final List extendedIngredients;

  const CustomListOfIngredients({super.key, required this.extendedIngredients});

  @override
  State<CustomListOfIngredients> createState() =>
      _CustomListOfIngredientsState();
}

class _CustomListOfIngredientsState extends State<CustomListOfIngredients> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10.h,),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Row(
        children: [
          SizedBox(width: 20.w),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: ColorsManager.orangeF7,
              shape: BoxShape.circle,
            ),
            child: Text(
              (index + 1).toString(),
              style: PoppinsStyleManager.semiBold(
                color: ColorsManager.white,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              widget.extendedIngredients[index].original ?? "",
              style: PoppinsStyleManager.regular(fontSize: FontSizeManager.s16),
            ),
          ),
        ],
      ),
      itemCount: widget.extendedIngredients.length ?? 0,
    );
  }
}
