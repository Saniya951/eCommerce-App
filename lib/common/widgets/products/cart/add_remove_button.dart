import 'package:ecommerce/common/widgets/icons/s_circular_icon.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SProductQuantityWithAddRemoveButton extends StatelessWidget {
  const SProductQuantityWithAddRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return 
        //add remove button
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SCircularIcon(
              icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: SSizes.md,
              color: dark ? SColors.white : SColors.black,
              backgroundColor: dark ? SColors.darkerGrey : SColors.light,
            ),
            const SizedBox(width: SSizes.spaceBtwItems),
            Text('2', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: SSizes.spaceBtwItems),
            SCircularIcon(
              icon: Iconsax.add,
              width: 32,
              height: 32,
              size: SSizes.md,
              color: SColors.white,
              backgroundColor: SColors.primary,
            ),
          ],
        
    );
  }
}
