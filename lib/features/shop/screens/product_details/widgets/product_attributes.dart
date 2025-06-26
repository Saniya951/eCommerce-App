import 'package:ecommerce/common/widgets/chips/choice_chip.dart';
import 'package:ecommerce/common/widgets/products/product_card/rounded_container.dart';
import 'package:ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SProductAttributes extends StatelessWidget {
  const SProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SRoundedContainer(
          padding: EdgeInsets.all(SSizes.md),
          backgroundColor: dark ? SColors.darkerGrey : SColors.grey,
          child: Column(
            children: [
              //title,price,status
              Row(
                children: [
                  //title
                  SSectionHeading(title: 'Variations', showActionButton: false),
                  const SizedBox(width: SSizes.spaceBtwItems),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //sale price
                      Row(
                        children: [
                          const SProductTitleText(
                            title: 'Price: ',
                            smallSize: true,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: SSizes.spaceBtwItems),
                          const SProductPriceText(price: '20'),
                        ],
                      ),

                      //status
                      Row(
                        children: [
                          const SProductTitleText(
                            title: 'Stock: ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stack',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              //Variation description
              SProductTitleText(
                title:
                    'This is teh Description of teh Product and it can go upto max 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(width: SSizes.spaceBtwItems),

        //ATTRIBUTES
        //colors
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SSectionHeading(title: 'Colors', showActionButton: false),
            SizedBox(width: SSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                SChoiceShape(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                SChoiceShape(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                SChoiceShape(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),

        //Sizes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SSectionHeading(title: 'Size', showActionButton: false),
            SizedBox(width: SSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                SChoiceShape(text: 'Eu 34', selected: true),
                SChoiceShape(text: 'Eu 36', selected: false),
                SChoiceShape(text: 'Eu 38', selected: false),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
