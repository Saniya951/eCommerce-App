import 'package:ecommerce/common/widgets/images/s_circular_image.dart';
import 'package:ecommerce/common/widgets/products/product_card/rounded_container.dart';
import 'package:ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce/common/widgets/texts/s_brand_title_text_with_verified_icon.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SProductMetaData extends StatelessWidget {
  const SProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price & sale price
        Row(
          children: [
            //Sale tag
            SRoundedContainer(
              radius: SSizes.sm,
              backgroundColor: SColors.secondary.withAlpha((0.8 * 255).toInt()),
              padding: EdgeInsets.symmetric(
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
            const SizedBox(width: SSizes.spaceBtwItems),

            //price
            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: SSizes.spaceBtwItems),
            SProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(width: SSizes.spaceBtwItems / 1.5),

        //title
        const SProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(width: SSizes.spaceBtwItems / 1.5),

        //stock status
        Row(
          children: [
            const SProductTitleText(title: 'Status'),
            const SizedBox(width: SSizes.spaceBtwItems),
            Text('In Stack', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: SSizes.spaceBtwItems),

        //brand
        Row(
          children: [
            SCircularImage(image: SImages.cosmeticsIcon,width: 32,height: 32,overlayColor: dark? SColors.white:SColors.dark,),
            SBrandTitleTextWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),

      ],
    );
  }
}
