import 'package:ecommerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TermsAndConditionCheckbox extends StatelessWidget {
  const TermsAndConditionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = SHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged:
                  (value) =>
                      controller.privacyPolicy.value =
                          !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: SSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${STexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              TextSpan(
                text: '${STexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? SColors.white : SColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? SColors.white : SColors.primary,
                ),
              ),

              TextSpan(
                text: '${STexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              TextSpan(
                text: STexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? SColors.white : SColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? SColors.white : SColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
