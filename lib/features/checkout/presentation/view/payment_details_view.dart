import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/shared/styles.dart';
import '../../../../core/shared/widgets/buttons/onboarding_Button.dart';
import 'widgets/custom_credit_card.dart';
import 'widgets/points.dart';
import 'widgets/visa_card.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  List<String> icons = [
    IconsAsset.visa,
    IconsAsset.paypal,
    IconsAsset.iphonpay
  ];
  int cardIndex = 0;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,

          leading: Center(child: SvgPicture.asset(IconsAsset.back)),
          title: Text(
            'Payment Details',
            style: Styles.textStyle25bold,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                      height: 60.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: icons.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: GestureDetector(
                            onTap: () {
                              cardIndex = index;
                              setState(() {});
                            },
                            child: VisaCard(
                              isActive: cardIndex == index,
                              icon: icons[index],
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 34.h),
                  CustomCreditCard(
                    points:
                        Points(length: icons.length, selectedindex: cardIndex),
                    formKey: formKey,
                    autovalidateMode: autovalidateMode,
                  )
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppTextButton(
                    text: "Play",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        log("payment");
                        formKey.currentState!.save();
                      } else {
                        autovalidateMode = AutovalidateMode.disabled;
                      }
                    },
                  )),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 34.h)),
          ]),
        ));
  }
}
