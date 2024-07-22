import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/class/crud.dart';
import '../model/payment_intent_input_model/payment_intent_input_model.dart.dart';

class StripeData {
  Crud crud = Crud();
  createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await crud.postData(
        url: "https://api.stripe.com/v1/payment_intents",
        data: paymentIntentInputModel.toJson());
    return response;
  }

  Future iniPaymentSheet({
    required String paymentInitentClientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'Temsah13',
      paymentIntentClientSecret: paymentInitentClientSecret,
    ));
  }

  Future displayPaymentSheet() async {
   await Stripe.instance.presentPaymentSheet();
  }
}
