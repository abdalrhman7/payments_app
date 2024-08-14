import 'package:flutter/material.dart';
import 'package:payment_integration/core/widget/build_app_bar.dart';
import 'package:payment_integration/features/checkout/presentaton/views/thank_you_view/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
          offset: const Offset(0, -12),
          child: const ThankYouViewBody()),
    );
  }
}


