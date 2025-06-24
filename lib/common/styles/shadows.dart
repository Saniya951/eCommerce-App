import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SShadowsStyle {
  static final verticalProductShadow = BoxShadow(
    color: SColors.darkerGrey.withAlpha((0.1 * 255).toInt()),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: SColors.darkerGrey.withAlpha((0.1 * 255).toInt()),

    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );


}
