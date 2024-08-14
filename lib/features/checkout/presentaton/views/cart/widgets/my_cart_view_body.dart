import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/core/utils/styles.dart';
import 'package:payment_integration/core/widget/custom_button.dart';
import 'package:payment_integration/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment_integration/features/checkout/presentaton/manger/cubit/payment_cubit.dart';
import 'package:payment_integration/features/checkout/presentaton/views/cart/widgets/order_indo_item.dart';
import 'package:payment_integration/features/checkout/presentaton/views/cart/widgets/payment_method_bottom_sheet.dart';
import 'package:payment_integration/features/checkout/presentaton/views/cart/widgets/total_price.dart';
import 'package:payment_integration/features/checkout/presentaton/views/payment_details/payment_details.dart';
import 'package:payment_integration/features/checkout/presentaton/views/payment_details/widgets/payment_method_list_view.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset('assets/images/group.png')),
          const SizedBox(height: 25),
          const OrderInfoItem(title: 'Order Subtotal', value: r'12$',),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Discount', value: r'123$',),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Shipping', value: r'50$',),
          const Divider(thickness: 2, color: Color(0xffC7C7C7), height: 34,),
          const SizedBox(height: 3),
          const TotalPrice(title: 'Total', value: r'80$',),
          const SizedBox(height: 16),
          CustomButton(text: 'Complete Payment', onTap: () {
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PaymentDetailsView()));
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context, builder: (context) {
              return BlocProvider(
                create: (context) => PaymentCubit(CheckoutRepoImpl()),
                child: const PaymentMethodBottomSheet(),
              );
            },);
          }),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}




