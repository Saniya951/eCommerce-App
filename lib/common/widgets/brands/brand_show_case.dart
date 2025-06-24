import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:ecommerce/common/widgets/products/product_card/rounded_container.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SBrandShowCase extends StatelessWidget {
  const SBrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SRoundedContainer(
      showBorder: true,
      borderColor: SColors.darkGrey,
      padding: const EdgeInsets.all(SSizes.md),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: SSizes.spaceBtwItems),
      child: Column(
        children: [
          const SBrandCard(showBorder: false),
          const SizedBox(height: SSizes.spaceBtwItems),

          //brands top 3 products
          Row(
            children:
                images
                    .map((image) => brandTopProductImagesWidget(image, context))
                    .toList(),
          ),
        ],
      ),
    );
  }
}

Widget brandTopProductImagesWidget(String image, context) {
  return Expanded(
    child: SRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(SSizes.md),
      backgroundColor:
          SHelperFunctions.isDarkMode(context)
              ? SColors.darkerGrey
              : SColors.light,
      margin: const EdgeInsets.only(right: SSizes.sm),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
