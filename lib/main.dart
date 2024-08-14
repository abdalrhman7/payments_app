import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/core/utils/api_keys.dart';

import 'features/checkout/presentaton/views/cart/my_cart_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.puplishableKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       home: const MyCartView(),
    );
  }
}

// 1 -
// paymentIntentObject = create payment intent (amount , currency)
// init payment sheet (payment intent client secret)
// init payment sheet (SetupPaymentSheetParameters(merchant display name , payment intent client secret))
//presentPaymentSheet()

// save user Info
// paymentIntentObject = create payment intent (amount , currency , customer id)
// KeySecret = createEphemeralKey(stripe version , customer id)
// init payment sheet (SetupPaymentSheetParameters(payment intent client secret ,EphemeralKey , merchant display name))
//presentPaymentSheet()
