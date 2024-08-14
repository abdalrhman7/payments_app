import 'package:flutter/material.dart';

import 'features/checkout/presentaton/views/cart/my_cart_view.dart';

void main() {
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


// paymentIntentObject = create payment intent (amount , currency)
// init payment sheet (payment intent client secret)