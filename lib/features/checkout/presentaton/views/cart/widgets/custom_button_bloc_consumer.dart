import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_integration/core/utils/api_keys.dart';
import 'package:payment_integration/core/widget/custom_button.dart';
import 'package:payment_integration/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/data/model/paypal_model/amount_model.dart';
import 'package:payment_integration/features/checkout/data/model/paypal_model/item_list_model.dart';
import 'package:payment_integration/features/checkout/presentaton/manger/cubit/payment_cubit.dart';
import 'package:payment_integration/features/checkout/presentaton/views/payment_details/payment_details.dart';
import 'package:payment_integration/features/checkout/presentaton/views/paymop/paymop_view.dart';
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
            if (BlocProvider.of<PaymentCubit>(context).selectedPaymentMethod == 'stripe') {
              PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
                amount: '100',
                currency: 'usd',
                customerId: 'cus_OvTlnS3BNlO7eF',
              );
              BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
            }else if(BlocProvider.of<PaymentCubit>(context).selectedPaymentMethod == 'paypal'){
              var transactionData = getTransactionData();
              executePaypalPayment(context, transactionData);
            }else if(BlocProvider.of<PaymentCubit>(context).selectedPaymentMethod == 'Custom'){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const PaymentDetailsView(),
                ),
              );
            }
            else{
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const PayMopView(),
                ),
              );
            }
          },
        );
      },
    );
  }

  void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.paypalClientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionData.itemList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const ThankYouView(),
              ),
            );
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionData() {
    AmountModel amount = AmountModel(
        total: '100',
        currency: 'USD',
        details: Details(
          subtotal: '100',
          shipping: '0',
          shippingDiscount: 0,
        ));
    List<OrderItemModel> orders = [
      OrderItemModel(
        name: 'Apple',
        quantity: 4,
        price: '10',
        currency: 'USD',
      ),
      OrderItemModel(
        name: 'Pineapple',
        quantity: 5,
        price: '12',
        currency: 'USD',
      ),
    ];
    var itemList = ItemListModel(orders: orders);
    return (amount: amount, itemList: itemList);
  }
}
