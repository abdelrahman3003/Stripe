import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe1/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart.dart';
import 'package:stripe1/features/checkout/presentation/controllers/payment/payment_cubit.dart';
import 'package:stripe1/features/checkout/presentation/view/payment_details_view.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/shared/styles.dart';
import '../../../../core/shared/widgets/buttons/onboarding_Button.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Center(child: SvgPicture.asset(IconsAsset.back)),
          title: Text(
            'My Card',
            style: Styles.textStyle25bold,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImageAsset.basket),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Order Subtotal',
                        style: Styles.textStyle18w400,
                      ),
                    ),
                    Text('\$42.97', style: Styles.textStyle18w400),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Discount',
                        style: Styles.textStyle18w400,
                      ),
                    ),
                    Text('\$0', style: Styles.textStyle18w400),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Shipping',
                        style: Styles.textStyle18w400,
                      ),
                    ),
                    Text(
                      '\$8',
                      style: Styles.textStyle18w400.copyWith(height: 1),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Divider(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text('Total', style: Styles.textStyle24w600),
                    ),
                    Text('\$50.97', style: Styles.textStyle24w600),
                  ],
                ),
                const SizedBox(height: 10),
                BlocProvider(
                  create: (context) => PaymentCubit(),
                  child: BlocConsumer<PaymentCubit, PaymentState>(
                    listener: (context, state) {
                      if (state is PaymentSucess) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const PaymentDetailsView(),
                        ));
                      }
                      if (state is PaymentFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.erroMessage)));
                      }
                    },
                    builder: (context, state) {
                      return AppTextButton(
                        isloading: state is PaymentLoading ? true : false,
                        text: "Complete Payment",
                        onPressed: () {
                          BlocProvider.of<PaymentCubit>(context).payment(
                              PaymentIntentInputModel(
                                  amount: '200', currency: 'USD'));
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
