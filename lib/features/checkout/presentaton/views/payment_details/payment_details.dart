import 'package:flutter/material.dart';
import 'package:payment_integration/core/widget/build_app_bar.dart';
import 'package:payment_integration/features/checkout/presentaton/views/payment_details/widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Details'),),
      body: const PaymentDetailsViewBody(),
    );
  }
}
