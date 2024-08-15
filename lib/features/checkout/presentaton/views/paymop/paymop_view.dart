import 'package:flutter/material.dart';
import 'package:payment_integration/core/utils/paymop_service.dart';
import 'package:payment_integration/core/widget/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class PayMopView extends StatelessWidget {
  const PayMopView({super.key});

  final int amount = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PayMop'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomButton(
            text: 'Pay $amount EGP',
            onTap: ()  {
               _pay();
            },
          ),
        ),
      ),
    );
  }

  Future<void> _pay() async {
    PayMopService().getPaymentKey(amount, "EGP").then((String paymentKey) {
      launchUrl(
        Uri.parse(
            "https://accept.paymob.com/api/acceptance/iframes/778845?payment_token=$paymentKey"),
      );
    });
  }
}
