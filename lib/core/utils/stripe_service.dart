import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/core/utils/api_keys.dart';
import 'package:payment_integration/core/utils/api_service.dart';
import 'package:payment_integration/features/checkout/data/model/ephemeral_key.dart';
import 'package:payment_integration/features/checkout/data/model/ini_payment_sheet_input_model.dart';
import 'package:payment_integration/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/data/model/payment_intent_model.dart';

class StripeService {
  ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    print(paymentIntentInputModel.toJson());
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    print('${paymentIntentModel.clientSecret}++++++++++++');
    return paymentIntentModel;
  }

  // Future<PaymentIntentModel> createCustomer(
  //     PaymentIntentInputModel paymentIntentInputModel) async {
  //   var response = await apiService.post(
  //     body: paymentIntentInputModel.toJson(),
  //     url: 'https://api.stripe.com/v1/customers',
  //     token: ApiKeys.secretKey,
  //     contentType: Headers.formUrlEncodedContentType,
  //   );
  //   var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
  //   return paymentIntentModel;
  // }


  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerId: initPaymentSheetInputModel.customerId,
        customerEphemeralKeySecret:
        initPaymentSheetInputModel.ephemeralKeySecret,
        merchantDisplayName: 'Nopy',
      ),
    );
  }

  Future displayPaymentSheet() async {
   await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeraKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentModel.customer,
        ephemeralKeySecret: ephemeraKeyModel.secret!);
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKey> createEphemeralKey({required String customerId}) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2023-08-16',
      },
    );
    return EphemeralKey.fromJson(response.data);
  }
}