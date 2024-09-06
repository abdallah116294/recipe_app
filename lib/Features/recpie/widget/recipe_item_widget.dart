import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/color_manager.dart';
import 'package:recipe_app/core/widgets/custom_text.dart';

class RecipeItemWidget extends StatelessWidget {
  RecipeItemWidget(
      {super.key,
      required this.imageUrl,
      required this.recipeName,
      this.calories,
      this.isFavorite,this.onTap});
  final String imageUrl;
  final String recipeName;
  String? calories;
  bool? isFavorite;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 15.w,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            )
          ],
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          )),
      child: Column(
        children: [
   
         Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 isFavorite == true ?   IconButton(
                        onPressed: onTap,
                        icon: Icon(
                          Icons.favorite_sharp,
                          color: ColorManager.primary,
                        )):const SizedBox(),
             isFavorite == false ?       Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: ColorManager.yellow,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: CustomText(
                              text: calories.toString(),
                              color: ColorManager.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12)),
                    ):const SizedBox(),
                  ],
                )),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomText(
                text: recipeName,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )
        ],
      ),
    );
  }
}
