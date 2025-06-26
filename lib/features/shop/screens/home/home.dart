import 'package:ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SPrimaryHeaderContainer(
              child: Column(
                children: [
                  //appbar
                  const SHomeAppBar(),
                  const SizedBox(height: SSizes.spaceBtwSections),

                  //search bar
                  const SSearchContainer(text: 'Search in Store'),
                  const SizedBox(height: SSizes.spaceBtwSections),

                  //categories
                  // Padding(
                  //   padding: EdgeInsets.only(left: SSizes.defaultSpace),
                  //   child: Column(
                  //     children: [
                  //       SSectionHeading(
                  //         title: 'Popular Categories',
                  //         showActionButton: false,
                  //         textColor: Colors.white,
                  //       ),
                  //       SizedBox(height: SSizes.spaceBtwItems),

                  //       //cateogories
                  //       SHomeCategories(),
                  //     ],
                  //   ),
                  // ),
                  SHomeCategories(),
                  const SizedBox(height: SSizes.spaceBtwSections),
                ],
              ),
            ),

            //BODY
            Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  //Promo Slider
                  const SPromoSlider(
                    banners: [
                      SImages.promoBanner1,
                      SImages.promoBanner2,
                      SImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: SSizes.spaceBtwSections),

                  //Heading
                  SSectionHeading(
                    title: 'Popular Product',
                    onPressed: () => Get.to(() => AllProducts()),
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems),

                  //Popular Products
                  SGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const SProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
