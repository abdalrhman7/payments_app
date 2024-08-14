import 'package:flutter/material.dart';
import 'package:payment_integration/core/widget/custom_button.dart';
import 'package:payment_integration/features/checkout/presentaton/views/payment_details/widgets/payment_method_list_view.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          const PaymentMethodListView(),
          const SizedBox(height: 32),
          CustomButton(text: 'Continue', onTap: (){}),
        ],
      ),
    );
  }
}