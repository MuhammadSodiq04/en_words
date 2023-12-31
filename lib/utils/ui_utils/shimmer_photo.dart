import 'package:en_words/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPhoto extends StatelessWidget {
  const ShimmerPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: AppColors.c_6C63FF,
        child: Container(
          height: 100.h,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.white,
          ),
        ));
  }
}