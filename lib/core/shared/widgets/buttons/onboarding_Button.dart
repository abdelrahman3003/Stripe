import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/colors.dart';
import '../../styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key, required this.text, this.onPressed, this.isloading = false});
  final String text;
  final bool isloading;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: ColorsApp.buttonColor,
          minimumSize: Size(double.infinity, 60.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
        child: isloading
            ? const CircularProgressIndicator()
            : Text(text, style: Styles.textStyle22w500));
  }
}
