import 'package:ecommerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            Text(
              STexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: SSizes.spaceBtwItems),
            Text(
              STexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: SSizes.spaceBtwSections * 2),

            //textfield
            TextField(
              decoration: const InputDecoration(
                labelText: STexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),

            const SizedBox(height: SSizes.spaceBtwSections),
            //submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.off(()=> const ResetPassword()),
                child: const Text(STexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
