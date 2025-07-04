import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/shimmer.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SHomeAppBar extends StatelessWidget {
  const SHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return SAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            STexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: SColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const SShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: SColors.white),
              );
            }
          }),
        ],
      ),
      actions: [SCartCounterIcon(onPressed: () {}, iconColor: SColors.white)],
    );
  }
}
