import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget Weakness({required weakness}) {
  return Container(
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(15.r),
    ),
    child: Text(
      "$weakness",
      style: TextStyle(fontSize: 15.sp,color: Colors.white),
    ),
  );
}
