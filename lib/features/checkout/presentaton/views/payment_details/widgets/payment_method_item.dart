import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_integration/core/utils/styles.dart';
import 'package:payment_integration/features/checkout/data/model/payment_methode_model.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.isActive = false,
    required this.paymentMethodeModel, required this.isImage,
  });

  final bool isActive;
  final PaymentMethodeModel paymentMethodeModel;
  final bool isImage ;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 103,
      height: 66,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: isActive ? 2.4 : 1.4,
              color: isActive ? const Color(0xFF34A853) : Colors.grey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          shadows: [
            BoxShadow(
              color: isActive ? const Color(0xFF34A853) : Colors.white,
              offset: const Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 0,
            )
          ]),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Center(
          child: isImage ? SvgPicture.asset(
            paymentMethodeModel.image,
            fit: BoxFit.scaleDown,
            height: 40,
          ) :  Text(paymentMethodeModel.title , style: Styles.styleBold18.copyWith(color: Colors.blue.shade900),),
        ),
      ),
    );
  }
}
