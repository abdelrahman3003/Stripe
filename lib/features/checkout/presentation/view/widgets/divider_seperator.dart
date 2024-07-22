import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerSeperator extends StatelessWidget {
  const DividerSeperator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        20,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              height: 2.h,
              color: const Color(0xffB8B8B8),
            ),
          ),
        ),
      ),
    );
  }
}
