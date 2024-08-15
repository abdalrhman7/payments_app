import 'dart:async';

import 'package:dio/dio.dart';
import 'package:payment_integration/core/utils/api_keys.dart';
import 'package:payment_integration/core/utils/api_service.dart';

class PayMopService {
  ApiService apiService = ApiService();

  Future<String> getPaymentKey(int amount,String currency)async{
    try {
      String authenticationToken= await _getAuthenticationToken();

      int orderId= await _getOrderId(
        authenticationToken: authenticationToken,
        amount: (100*amount).toString(),
        currency: currency,
      );

      String paymentKey= await _getPaymentKey(
        authenticationToken: authenticationToken,
        amount: (100*amount).toString(),
        currency: currency,
        orderId: orderId.toString(),
      );
      print(paymentKey);
      return paymentKey;
    } catch (e) {
      print("Exc==========================================");
      print(e.toString());
      throw Exception();
    }
  }

  Future<String>_getAuthenticationToken()async{
    final Response response=await apiService.post(
       url: "https://accept.paymob.com/api/auth/tokens",
        body: {
          "api_key":ApiKeys.payMopApiKey,
        }
    );
    return response.data["token"];
  }

  Future<int> _getOrderId({
    required String authenticationToken,
    required String amount,
    required String currency,
  })async{
    final Response response=await Dio().post(
        "https://accept.paymob.com/api/ecommerce/orders",
        data: {
          "auth_token":  authenticationToken,
          "amount_cents":amount, //  >>(STRING)<<
          "currency": currency,//Not Req
          "delivery_needed": "false",
          "items": [],
        }
    );
    return response.data["id"];  //INTGER
  }

  Future<String> _getPaymentKey({
    required String authenticationToken,
    required String orderId,
    required String amount,
    required String currency,
  }) async{
    final Response response=await Dio().post(
        "https://accept.paymob.com/api/acceptance/payment_keys",
        data: {
          "expiration": 3600,

          "auth_token": authenticationToken,//From First Api
          "order_id":orderId,//From Second Api  >>(STRING)<<
          "integration_id": ApiKeys.payMopIntegrationId,//Integration Id Of The Payment Method

          "amount_cents": amount,
          "currency": currency,

          "billing_data": {
            //Have To Be Values (required)
            "first_name": "abdalrhman",
            "last_name": "amr",
            "email": "nopy@exa.com",
            "phone_number": "01154237440",

            //Can Set "NA"
            "apartment": "NA",
            "floor": "NA",
            "street": "NA",
            "building": "NA",
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "state": "NA"
          },
        }
    );
    return response.data["token"];
  }
}
