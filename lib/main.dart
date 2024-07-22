import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe1/checkout.dart';

import 'core/class/api_keys.dart';

void main() {
  Stripe.publishableKey = ApiKeys.stripePublishKeu;
  runApp(const Checkout());
}
//PaymentIntentObject create paymentintent(amount,currency)
//Init Paymentsheet (PaymentIntentClientSecret)
//present payment sheet