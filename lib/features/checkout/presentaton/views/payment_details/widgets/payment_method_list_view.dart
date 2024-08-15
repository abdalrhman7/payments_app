

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/features/checkout/data/model/payment_methode_model.dart';
import 'package:payment_integration/features/checkout/presentaton/manger/cubit/payment_cubit.dart';
import 'package:payment_integration/features/checkout/presentaton/views/payment_details/widgets/payment_method_item.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {

  final List<PaymentMethodeModel> paymentMethode = [
    const PaymentMethodeModel(image: 'assets/images/card.svg', title: 'stripe'),
    const PaymentMethodeModel(image: 'assets/images/paypal.svg', title: 'paypal'),
    const PaymentMethodeModel(image: '', title: 'PayMop'),
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              activeIndex = index;
              BlocProvider.of<PaymentCubit>(context).selectedPaymentMethod = paymentMethode[index].title;
              setState(() {});
            },
            child: PaymentMethodItem(
              image: paymentMethode[index].image,
              isActive: activeIndex == index,
              isImage: paymentMethode[index].title != 'PayMop',
            ),
          ),
        ),
        itemCount: paymentMethode.length,
        shrinkWrap: true,
      ),
    );
  }
}

