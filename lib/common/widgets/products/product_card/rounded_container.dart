import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SRoundedContainer extends StatelessWidget {
  const SRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius=SSizes.cardRadiusLg,
    this.child,
    this.showBorder=false,
    this.borderColor=SColors.borderPrimary,
    this.backgroundColor=SColors.white,
    this.padding,
    this.margin,
  });

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override 
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin:margin,
      decoration: BoxDecoration(
        color:backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder?Border.all(color:borderColor):null,
      ),
      child:child,
    );
  }
}
