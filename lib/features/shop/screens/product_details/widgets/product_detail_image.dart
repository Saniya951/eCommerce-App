import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce/common/widgets/icons/s_circular_icon.dart';
import 'package:ecommerce/common/widgets/images/s_rounded_images.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SProductImageSlider extends StatelessWidget {
  const SProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return SCurvedEdgesWidget(
      child: Container(
        color: dark ? SColors.darkerGrey : SColors.light,
        child: Stack(
          children: [
            //MAIN large image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(SSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(SImages.productImage1),
                  ),
                ),
              ),
            ),
    
            //Image Slider
            Positioned( //for small sub items
              right:0,
              bottom:30,
              left:SSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder:
                      (_, __) =>
                          const SizedBox(width: SSizes.spaceBtwItems),
                  itemBuilder:
                      (_, index) => SRoundedImage(
                        width: 80,
                        backgroundColor:
                            dark ? SColors.dark : SColors.white,
                        border: Border.all(color: SColors.primary),
                        padding: EdgeInsets.all(SSizes.sm),
                        imageUrl: SImages.productImage3,
                      ),
                ),
              ),
            ),
    
            //Appbar ICon
            const SAppBar(
              showBackArrow: true,
              actions: [
                SCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )
    
    
          ],
        ),
      ),
    );
  }
}
