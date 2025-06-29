import 'package:ecommerce/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SSocialButtons extends StatelessWidget {
  const SSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: SColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: ()=> controller.googleSignIn(),
            icon: const Image(
              width: SSizes.iconMd,
              height: SSizes.iconMd,
              image: AssetImage(SImages.google),
            ),
          ),
        ),
        const SizedBox(width: SSizes.spaceBtwItems),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: SColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: SSizes.iconMd,
              height: SSizes.iconMd,
              image: AssetImage(SImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
