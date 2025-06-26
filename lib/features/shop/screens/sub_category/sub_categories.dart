import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/images/s_rounded_images.dart';
import 'package:ecommerce/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        showBackArrow: true,
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              //banner
              SRoundedImage(
                imageUrl: SImages.promoBanner3,
                applyImageRadius: true,
                width: double.infinity,
                height: null,
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              //subcategories
              Column(
                children: [
                  //heading of subcategory
                  SSectionHeading(title: 'Sports Shirts', onPressed: () {}),
                  const SizedBox(height: SSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:
                          (context, index) => const SProductCardHorizontal(),
                      separatorBuilder:
                          (context, index) =>
                              const SizedBox(width: SSizes.spaceBtwItems),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
