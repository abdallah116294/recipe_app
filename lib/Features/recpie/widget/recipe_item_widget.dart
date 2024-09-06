import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/widgets/custom_text.dart';

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({super.key,required this.imageUrl,required this.recipeName});
  final String imageUrl;
  final String recipeName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 15.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image:  DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          )),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: recipeName,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20)
        ],
      ),
    );
  }
}
