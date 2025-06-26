import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/products/cart/coupon_widget.dart';
import 'package:ecommerce/common/widgets/products/product_card/rounded_container.dart';
import 'package:ecommerce/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce/naviagtion_menu.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: SAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              //items in cart
              const SCartItems(showAddRemoveButtons: false),
              const SizedBox(height: SSizes.spaceBtwSections),

              //coupon textfield
              SCouponCode(),
              const SizedBox(height: SSizes.spaceBtwSections),

              //billing
              SRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(SSizes.md),
                backgroundColor: dark ? SColors.dark : SColors.white,
                child: Column(
                  children: [
                    //pricing
                    SBillingAmountSection(),
                    const SizedBox(height: SSizes.spaceBtwItems),

                    //divider
                    const Divider(),
                    const SizedBox(height: SSizes.spaceBtwItems),

                    //payment methods
                    SBillingPaymentSection(),
                    const SizedBox(height: SSizes.spaceBtwItems),

                    //address
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: ElevatedButton(
          onPressed:
              () => Get.to(
                () => SuccessScreen(
                  image: SImages.successfulPaymentIcon,
                  title: 'Payment Success',
                  subTitle: 'Your Item will be shipped soon!',
                  onPressed: () => Get.to(() => const NavigationMenu()),
                ),
              ),
          child: Text('Checkout \$250'),
        ),
      ),
    );
  }
}
