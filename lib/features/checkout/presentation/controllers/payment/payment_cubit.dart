import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../../core/class/statuscode.dart';
import '../../../../../core/function/handling _data.dart';
import '../../../data/model/payment_intent_input_model/payment_intent_input_model.dart.dart';
import '../../../data/model/payment_intent_model/payment_intent_model.dart';
import '../../../data/repos/scripe_data.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  StripeData stripeData = StripeData();
  StatusRequest statusRequest = StatusRequest.none;
  Future payment(PaymentIntentInputModel paymentIntentInputModel) async {
    emit(PaymentLoading());
    var response =
        await stripeData.createPaymentIntent(paymentIntentInputModel);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      PaymentIntentModel paymentIntentModel =
          PaymentIntentModel.fromJson(response);
      await stripeData.iniPaymentSheet(
          paymentInitentClientSecret: paymentIntentModel.clientSecret!);
      await stripeData.displayPaymentSheet();
      emit(PaymentSucess());
    } else {
      emit(PaymentFailure(erroMessage: "$statusRequest"));
    }
  }
}
