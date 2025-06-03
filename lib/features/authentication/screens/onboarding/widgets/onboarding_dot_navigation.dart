import 'package:ecommerce/features/authentication/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = SHelperFunctions.isDarkMode(context);
    final controller = OnBoardingController();

    return Positioned(
      bottom: SDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: SSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick, //this will return int value nd go to onboarding_controller.dart file
        count: 3,
        effect: ExpandingDotsEffect(activeDotColor: dark?SColors.light : SColors.dark, dotHeight: 6),
      ),
    );
  }
}
