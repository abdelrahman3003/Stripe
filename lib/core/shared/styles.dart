import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors.dart';

abstract class Styles {
  static TextStyle textStyle25bold = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle textStyle18w400 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: ColorsApp.black1,
  );
    static TextStyle textStyle18w400black = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black
  );
  static TextStyle textStyle24w600 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle textStyle22w500 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}
