import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top:SSizes.appBarHeight,
    left:SSizes.defaultSpace,
    right:SSizes.defaultSpace,
    bottom:SSizes.defaultSpace,
  );
}