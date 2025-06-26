import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/screens/brands/brand_products.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(showBackArrow: true, title: Text('All Brands')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              //heading
              SSectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: SSizes.spaceBtwItems),

              //Brands
              SGridLayout(
                itemCount: 6,
                itemBuilder:
                    (context, index) => SBrandCard(
                      showBorder: true,
                      onTap: () => Get.to(() => const BrandProducts()),
                    ),
                mainAxisExtent: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
