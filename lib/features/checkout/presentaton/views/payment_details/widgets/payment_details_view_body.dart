import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment_integration/core/widget/custom_button.dart';
import 'package:payment_integration/features/checkout/presentaton/views/payment_details/widgets/payment_method_list_view.dart';
import 'package:payment_integration/features/checkout/presentaton/views/thank_you_view/thank_you_view.dart';
import 'package:payment_integration/features/checkout/presentaton/views/thank_you_view/widgets/thank_you_view_body.dart';

import 'custom_credit_card.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formKey: _formKey,
            autoValidateMode: autoValidateMode,
          ),
        ),
         SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
              child: CustomButton(
                text: 'Payment',
                onTap: () {
                  // if(_formKey.currentState!.validate()){
                  //   _formKey.currentState!.save();
                  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ThankYouViewBody(),));
                  // }else{
                  //   autoValidateMode = AutovalidateMode.always;
                  //   setState(() {});
                  // }
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ThankYouView(),));

                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
