import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/authentication/controllers/update_name/update_name_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      // Custom AppBar
      appBar: SAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(height: SSizes.spaceBtwSections),

            // Text Field and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  // First Name TextField
                  TextFormField(
                    controller: controller.firstName,
                    validator:
                        (value) =>
                            SValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: STexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),

                  const SizedBox(height: SSizes.spaceBtwInputFields),

                  // Last Name TextField
                  TextFormField(
                    controller: controller.lastName,
                    validator:
                        (value) =>
                            SValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: STexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: SSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child:ElevatedButton(onPressed: ()=> controller.updateUserName(), child: const Text('Save')),
            ),
            
          ],
        ),
      ),
    );
  }
}
