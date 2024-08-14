import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_integration/core/utils/styles.dart';
import 'package:payment_integration/features/checkout/presentaton/views/cart/widgets/total_price.dart';
import 'package:payment_integration/features/checkout/presentaton/views/thank_you_view/widgets/payment_item_info.dart';

import 'card_info_widget.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.blueAccent,
            Colors.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 66, left: 12, right: 12),
        child: Column(
          children: [
            Text('Thank You!',
                style: Styles.style25.copyWith(color: Colors.white)),
            Text(
              'Your Transaction Was Successful',
              style: Styles.style20.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 42),
            const PaymentItemInfo(
              title: 'Data',
              value: '01/24/2024',
            ),
            const SizedBox(height: 20),
            const PaymentItemInfo(
              title: 'Time',
              value: '11.15 AM',
            ),
            const SizedBox(height: 20),
            const PaymentItemInfo(
              title: 'To',
              value: 'Sam Louis',
            ),
            const Divider(thickness: 2, height: 60),
            const TotalPrice(
                title: 'Total', value: r'$50.97', color: Colors.white),
            const SizedBox(height: 30),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.50,
                        color: Color(0xFF34A853),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'PAID',
                    style:
                        Styles.style24.copyWith(color: const Color(0xFF34A853)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) /2) -29,
            )
          ],
        ),
      ),
    );
  }
}
