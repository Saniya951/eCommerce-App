import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_detail_image.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product image slider
            SProductImageSlider(),

            //product details
            Padding(
              padding: EdgeInsets.only(
                right: SSizes.defaultSpace,
                left: SSizes.defaultSpace,
                bottom: SSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  //Rating ,share button
                  SRatingAndShare(),

                  //price, title, stack,brand -product_meta_data.dart
                  SProductMetaData(),

                  //attributes
                  SProductAttributes(),
                  const SizedBox(height: SSizes.spaceBtwSections),

                  //checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: SSizes.spaceBtwSections),

                  // description
                  const SSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems),
                  ReadMoreText(
                    'This is product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and nothing ele',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: SSizes.spaceBtwSections),

                  //reviews
                  const Divider(),
                  const SizedBox(height: SSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SSectionHeading(
                        title: 'Reviews (199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed:
                            () => Get.to(() => const ProductReviewsScreen()),
                      ),
                    ],
                  ),
                  const SizedBox(height: SSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
