import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget Types({required type}) {
  return Container(
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(15.r),
    ),
    child: Text(
      "$type",
      style: TextStyle(fontSize: 15.sp),
    ),
  );
}
