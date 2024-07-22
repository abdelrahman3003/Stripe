
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/shared/styles.dart';
import 'widgets/divider_seperator.dart';

class PyamentSucess extends StatelessWidget {
  const PyamentSucess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Center(child: SvgPicture.asset(IconsAsset.back)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                  color: const Color(0xffEDEDED),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    Text("Thank you!", style: Styles.textStyle25bold),
                    Text("Your transaction was successful",
                        style: Styles.textStyle18w400black),
                    SizedBox(height: 40.h),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text("Date",
                                  style: Styles.textStyle18w400black)),
                          Text("01/24/2023",
                              style: Styles.textStyle18w400black),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text("Time",
                                  style: Styles.textStyle18w400black)),
                          Text("10:15 AM", style: Styles.textStyle18w400black),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text("To",
                                  style: Styles.textStyle18w400black)),
                          Text("Sam Louis", style: Styles.textStyle18w400black),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Row(
                        children: [
                          Expanded(
                              child:
                                  Text("Total", style: Styles.textStyle25bold)),
                          Text("\$50.97", style: Styles.textStyle25bold),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 75.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: ListTile(
                            leading: SvgPicture.asset(IconsAsset.mastercard),
                            title: Text("Credit Card",
                                style: Styles.textStyle18w400black),
                            subtitle: const Text(
                              "Mastercard **78",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                        padding: EdgeInsets.only(top: 100.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child:
                                    Image.asset(ImageAsset.scan, height: 70.h)),
                            Container(
                              height: 60.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xff34A853))),
                              child: Center(
                                  child: Text(
                                "PAID",
                                style: Styles.textStyle22w500
                                    .copyWith(color: const Color(0xff34A853)),
                              )),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: MediaQuery.sizeOf(context).height * .2,
                left: -20,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                )),
            Positioned(
                bottom: 170.h,
                right: -20,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.sizeOf(context).height * .2 + 20,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: const DividerSeperator())),
            Positioned(
                top: -40,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0xffEDEDED),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xff34A853),
                    radius: 40,
                    child: Icon(
                      Icons.check,
                      size: 60.sp,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
