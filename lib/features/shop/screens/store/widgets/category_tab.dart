import 'package:ecommerce/common/widgets/brands/brand_show_case.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SCategoryTab extends StatelessWidget {
  const SCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              SBrandShowCase(
                images: [
                  SImages.productImage3,
                  SImages.productImage2,
                  SImages.productImage1,
                ],
              ),
              const SizedBox(height: SSizes.spaceBtwItems),

              // Products
              SSectionHeading(
                title: 'You might like',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: SSizes.defaultSpace),

              SGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const SProductCardVertical(),
              ),
              const SizedBox(height: SSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
