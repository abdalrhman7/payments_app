import 'package:flutter/material.dart';
import 'package:payment_integration/features/checkout/presentaton/views/thank_you_view/widgets/thank_you_card.dart';

import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30 , right: 30 , bottom: 24 , ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 +20,
            left: 26,
            right: 26,
            child: const CustomDashedLine(),
          ),
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child:  CircleAvatar(
              backgroundColor: Colors.grey.shade100,
            ),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child:  CircleAvatar(
              backgroundColor: Colors.grey.shade100,
            ),
          ),
          const CustomCheckIcon(),
        ],
      ),
    );
  }
}






