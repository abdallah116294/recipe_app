import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/config/routes/app_routes.dart';
import 'package:recipe_app/core/utils/color_manager.dart';

import 'custom_text.dart';

showMessage({
  required String message,
  int maxLines = 5,
  required bool isError,
}) {
  ScaffoldMessenger.of(AppRoutes.currentContext).clearSnackBars();
  ScaffoldMessenger.of(AppRoutes.currentContext).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: ColorManager.grey2,
      elevation: 2.0,
      content: Row(
        children: [
          Container(
            height: 40.h,
            width: 5.w,
            decoration: BoxDecoration(
              color: isError ? ColorManager.red : ColorManager.green,
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
          SizedBox(width: 18.w),
          Expanded(
            child: CustomText(
              text: message,
              color: ColorManager.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              maxLines: maxLines,
            ),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(AppRoutes.currentContext).clearSnackBars();
            },
            child: Icon(
              Icons.close,
              color: ColorManager.black,
            ),
          ),
        ],
      ),
    ),
  );
}