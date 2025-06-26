import 'package:ecommerce/common/widgets/images/s_rounded_images.dart';
import 'package:ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce/common/widgets/texts/s_brand_title_text_with_verified_icon.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SCartItem extends StatelessWidget {
  const SCartItem({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        //image
        SRoundedImage(
          imageUrl: SImages.productImage1,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(SSizes.sm),
          backgroundColor:
              dark ? SColors.darkerGrey : SColors.light,
        ),
        const SizedBox(width: SSizes.spaceBtwItems),
    
        //title, price , size
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SBrandTitleTextWithVerifiedIcon(title: 'Nike'),
            Flexible(
              child: SProductTitleText(
                title: 'Black sports shoes',
                maxLines: 1,
              ),
            ),
            //attributes
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Color: ',
                    style:
                        Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: 'Green',
                    style:
                        Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: 'Size: ',
                    style:
                        Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: 'Uk 08',
                    style:
                        Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
