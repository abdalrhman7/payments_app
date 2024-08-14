

import 'package:flutter/material.dart';
import 'package:payment_integration/features/checkout/presentaton/views/payment_details/widgets/payment_method_item.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String> images = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
    'PayMop'
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
              setState(() {});
            },
            child: PaymentMethodItem(
              image: images[index],
              isActive: activeIndex == index,
              isImage: images[index] != 'PayMop',
            ),
          ),
        ),
        itemCount: images.length,
        shrinkWrap: true,
      ),
    );
  }
}