import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Points extends StatelessWidget {
  const Points({super.key, required this.length, required this.selectedindex});
  final int length;
  final int selectedindex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: ListView.builder(
        itemCount: length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          height: 8.h,
          width: 8.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: selectedindex == index ? Colors.black : Colors.grey),
        ),
      ),
    );
  }
}
