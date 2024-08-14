import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/core/widget/custom_button.dart';
import 'package:payment_integration/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/presentaton/manger/cubit/payment_cubit.dart';
import 'package:payment_integration/features/checkout/presentaton/views/thank_you_view/thank_you_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
        }
        if (state is PaymentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoading ? true : false,
          text: 'Continue',
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
              amount: '100',
              currency: 'usd',
              customerId: 'cus_OvTlnS3BNlO7eF',
            );
            BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
        );
      },
    );
  }
}
