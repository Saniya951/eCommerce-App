import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce/common/widgets/list_files/settings_menu_file.dart';
import 'package:ecommerce/common/widgets/list_files/user_profile_tile.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/personalization/screens/address/adress.dart';
import 'package:ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce/features/shop/screens/order/order.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            SPrimaryHeaderContainer(
              child: Column(
                children: [
                  SAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: SColors.white),
                    ),
                  ),
                  const SizedBox(height: SSizes.spaceBtwSections),

                  //User Profile Card
                  SUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(height: SSizes.spaceBtwSections),
                ],
              ),
            ),

            //body
            Padding(
              padding: EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  //heading
                  SSectionHeading(
                    title: 'Acccount Setting',
                    showActionButton: false,
                  ),
                  SizedBox(height: SSizes.spaceBtwItems),

                  SSettingsMenuFile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'set shopping delivery address',
                    onTap: () => Get.to(() => const UserAdressScreen()),
                  ),
                  SSettingsMenuFile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add,Remove products and move to checkout',
                    onTap: () {},
                  ),
                  SSettingsMenuFile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In-Progress or completed orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  SSettingsMenuFile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subtitle: 'withdraw balance to registre back account',
                    onTap: () {},
                  ),
                  SSettingsMenuFile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: 'List of all the discounted coupons',
                    onTap: () {},
                  ),
                  SSettingsMenuFile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'set any kind of notification message',
                    onTap: () {},
                  ),
                  SSettingsMenuFile(
                    icon: Iconsax.security_card,
                    title: 'Account privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  //App Settings
                  const SizedBox(height: SSizes.spaceBtwSections),
                  SSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems),
                  SSettingsMenuFile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subtitle: 'Upload data to cloud firebase',
                  ),
                  SSettingsMenuFile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'set recommendations based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SSettingsMenuFile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'search result is safe efor all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SSettingsMenuFile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  //logout button
                  const SizedBox(height: SSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: SSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
