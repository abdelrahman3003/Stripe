import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class VisaCard extends StatelessWidget {
  const VisaCard({
    super.key,
    required this.icon,
    this.isActive = false,
  });
  final String icon;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: 60.h,
      width: 103.w,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.5.w,
          color: isActive
              ? const Color(0xff34A853)
              : Colors.black.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(16.w),
        boxShadow: [
          BoxShadow(
            color: isActive
                ? const Color(0xff34A853)
                : Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 0, // No spread for border shadow
            blurRadius: 2, // Blur radius for softer edges
            offset: const Offset(0, 0), // Position of the shadow
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
