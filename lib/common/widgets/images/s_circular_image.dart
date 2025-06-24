import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SCircularImage extends StatelessWidget {
  const SCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkingImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = SSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkingImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            (SHelperFunctions.isDarkMode(context)
                ? SColors.black
                : SColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit:fit,
          image:isNetworkingImage? NetworkImage(image): AssetImage(image) as ImageProvider,
          color:overlayColor,
        ),
      ),
    );
  }
}
