import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SBillingAmountSection extends StatelessWidget {
  const SBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style:Theme.of(context).textTheme.bodyMedium),
            Text('\$250.6', style:Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems),

        //shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style:Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style:Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems),

        //Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style:Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style:Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems),

        //order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style:Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style:Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems),
      ],
    );
  }
}