

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_integration/core/utils/styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22 , vertical: 16),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/logo.svg'),
            const SizedBox(width: 22),
            Text.rich(
              TextSpan(
                  children: [
                    TextSpan(
                      text: 'Credit Card\n',
                      style: Styles.style18.copyWith(color: Colors.black),
                    ),
                    const TextSpan(
                      text: 'Mastercard **78',
                      style: Styles.style16Gray,
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}