import 'package:flutter/material.dart';
import 'package:payment_integration/core/utils/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value, this.color});
  final String title , value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.style24.copyWith(color: color),
        ),
        Text(
          value,
          style: Styles.style24.copyWith(color: color),
        ),
      ],
    );
  }
}