import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment_integration/core/widget/build_app_bar.dart';

import 'package:payment_integration/features/checkout/presentaton/views/cart/widgets/my_cart_view_body.dart';


class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: const MyCartViewBody(),
    );
  }


}


