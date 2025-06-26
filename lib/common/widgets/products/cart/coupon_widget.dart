import 'package:ecommerce/common/widgets/products/product_card/rounded_container.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class SCouponCode extends StatelessWidget {
  const SCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return SRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? SColors.dark : SColors.white,
      padding: EdgeInsets.only(
        top: SSizes.sm,
        bottom: SSizes.sm,
        right: SSizes.sm,
        left: SSizes.md,
      ),
      child: Row(
        children: [
          //textfield
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo ? Neter here',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          //button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    dark
                        ? SColors.white.withAlpha((0.5 * 255).toInt())
                        : SColors.dark.withAlpha((0.5 * 255).toInt()),
                backgroundColor: SColors.grey.withAlpha((0.2 * 255).toInt()),
                side: BorderSide(color: SColors.grey.withAlpha((0.1 * 255).toInt())),
              ),
              child: Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
