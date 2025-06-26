import 'package:ecommerce/common/widgets/products/product_card/rounded_container.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SSingleAddress extends StatelessWidget {
  const SSingleAddress({super.key, required this.selectedAdress});

  final bool selectedAdress;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return SRoundedContainer(
      padding: const EdgeInsets.all(SSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor:
          selectedAdress
              ? SColors.primary.withOpacity(0.5)
              : Colors.transparent,
      borderColor:
          selectedAdress
              ? Colors.transparent
              : dark
              ? SColors.darkerGrey
              : SColors.grey,
      margin: EdgeInsets.only(bottom: SSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAdress ? Iconsax.tick_circle5 : null,
              color:
                  selectedAdress
                      ? dark
                          ? SColors.light
                          : SColors.dark.withOpacity(0.6)
                      : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saniya Dangat',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: SSizes.sm / 2),
              const Text(
                '91+ 9867563200',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: SSizes.sm / 2),
              const Text('2/4 Uttar Bharatiya rec.soc. Vidyalaya Marg', softWrap: true,),
            ],
          ),
        ],
      ),
    );
  }
}
