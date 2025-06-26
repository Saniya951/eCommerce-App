import 'package:ecommerce/common/widgets/products/cart/add_remove_button.dart';
import 'package:ecommerce/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SCartItems extends StatelessWidget {
  const SCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder:
          (_, __) => const SizedBox(height: SSizes.spaceBtwSections),
      itemCount: 4,
      itemBuilder:
          (_, index) => Column(
            children: [
              //cartt item
              SCartItem(),
              if (showAddRemoveButtons)
                const SizedBox(height: SSizes.spaceBtwItems),
              //add remove buttons with total price
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 70),
                        //add remove button
                        SProductQuantityWithAddRemoveButton(),
                      ],
                    ),

                    SProductPriceText(price: '256'),
                  ],
                ),
            ],
          ),
    );
  }
}
