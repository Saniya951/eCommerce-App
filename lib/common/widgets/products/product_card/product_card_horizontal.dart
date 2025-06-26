import 'package:ecommerce/common/widgets/icons/s_circular_icon.dart';
import 'package:ecommerce/common/widgets/images/s_rounded_images.dart';
import 'package:ecommerce/common/widgets/products/product_card/rounded_container.dart';
import 'package:ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce/common/widgets/texts/s_brand_title_text_with_verified_icon.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SProductCardHorizontal extends StatelessWidget {
  const SProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SSizes.productImageRadius),
        color: dark ? SColors.darkerGrey : SColors.lightContainer,
      ),

      child: Row(
        children: [
          //Image
          SRoundedContainer(
            height: 120,
            padding: EdgeInsets.all(SSizes.sm),
            backgroundColor: dark ? SColors.dark : SColors.light,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: SRoundedImage(
                    imageUrl: SImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),
                const SizedBox(height: SSizes.spaceBtwItems / 2),

                //sale TAG
                Positioned(
                  top: 12,
                  child: SRoundedContainer(
                    radius: SSizes.sm,
                    backgroundColor: SColors.secondary.withAlpha(
                      (0.8 * 255).toInt(),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: SSizes.sm,
                      vertical: SSizes.xs,
                    ),
                    child: Text(
                      '25%',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: SColors.black),
                    ),
                  ),
                ),

                //heart icon
                Positioned(
                  top: 0,
                  right: 0,
                  child: SCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          ),

          //Info
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(left: SSizes.sm, top: SSizes.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SProductTitleText(
                        title: 'Green Nike Half Sleeves Shirt',
                        smallSize: true,
                      ),
                      SizedBox(height: SSizes.spaceBtwItems / 2),
                      SBrandTitleTextWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //pricing
                      Flexible(child: SProductPriceText(price: '3500.0')),

                      //add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: SColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(SSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              SSizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: const SizedBox(
                          width: SSizes.iconLg * 1.2,
                          height: SSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: SColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
