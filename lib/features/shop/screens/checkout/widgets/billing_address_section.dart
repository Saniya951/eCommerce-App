import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SBillingAdressSection extends StatelessWidget {
  const SBillingAdressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text('Coding with S', style:Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: SSizes.spaceBtwItems/2),

        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey,size: 16,),
            const SizedBox(height: SSizes.spaceBtwItems),
            Text('+9109867655944', style:Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems/2),


        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey,size: 16,),
            const SizedBox(height: SSizes.spaceBtwItems),
            Text('bhoir Nagar, Mulund East', style:Theme.of(context).textTheme.bodyMedium,softWrap: true,),
          ],
        ),


      ],
    );
  }
}