import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/images/s_circular_image.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/shimmer.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

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
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : SImages.user;
                      return controller.imageUploading.value? const SShimmerEffect(width: 80, height: 80,radius: 80,) :SCircularImage(
                        image: image,
                        width: 50,
                        height: 50,
                        isNetworkingImage: networkImage.isNotEmpty,
                      );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
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
                onPressed: () => Get.to(() => const ChangeName()),
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              SProfileMenu(
                onPressed: () {},
                title: 'UserName',
                value: controller.user.value.username,
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
                title: 'User ID',
                icon: Iconsax.copy,
                value: controller.user.value.id,
              ),
              SProfileMenu(
                onPressed: () {},
                title: 'Email',
                value: controller.user.value.email,
              ),
              SProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
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
                  onPressed: () => controller.deleteAccountWarningPopup(),
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
