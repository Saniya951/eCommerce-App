import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/images/s_circular_image.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(title: Text('Profile'), showBackArrow: true),
      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              //profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SCircularImage(image: SImages.user, width: 50, height: 50),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              //details
              const SizedBox(height: SSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: SSizes.spaceBtwItems),

              //profile info
              const SSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              SProfileMenu(
                onPressed: () {},
                title: 'Name',
                value: 'Saniya Dangat',
              ),
              SProfileMenu(
                onPressed: () {},
                title: 'UserName',
                value: 'saniyadangat',
              ),

              const SizedBox(height: SSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: SSizes.spaceBtwItems),

              //personal info
              const SSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              SProfileMenu(
                onPressed: () {},
                title: 'User-ID',
                icon: Iconsax.copy,
                value: '12654',
              ),
              SProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: 'saniyadangat',
              ),
              SProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: '92-919-59-56156',
              ),
              SProfileMenu(onPressed: () {}, title: 'Gender', value: 'Female'),
              SProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '29 Jan 2005',
              ),

              const Divider(),
              const SizedBox(height: SSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
